<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\DocumentRepositoryInterface;
use App\Models\Documents;
use App\Models\DocumentVersions;
use App\Models\FileRequestDocuments;
use App\Repositories\Contracts\ArchiveDocumentRepositoryInterface;
use App\Repositories\Contracts\DocumentMetaDataRepositoryInterface;
use App\Repositories\Contracts\DocumentShareableLinkRepositoryInterface;
use App\Repositories\Contracts\DocumentTokenRepositoryInterface;
use App\Repositories\Contracts\UserNotificationRepositoryInterface;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Ramsey\Uuid\Uuid;

class DocumentController extends Controller
{
    private $documentRepository;
    private  $documentMetaDataRepository;
    private $documenTokenRepository;
    private $userNotificationRepository;
    private $archiveDocumentRepository;
    private $documentShareableLinkRepository;
    protected $queryString;

    public function __construct(
        DocumentRepositoryInterface $documentRepository,
        DocumentMetaDataRepositoryInterface $documentMetaDataRepository,
        UserNotificationRepositoryInterface $userNotificationRepository,
        DocumentTokenRepositoryInterface $documenTokenRepository,
        ArchiveDocumentRepositoryInterface $archiveDocumentRepository,
        DocumentShareableLinkRepositoryInterface $documentShareableLinkRepository
    ) {
        $this->documentRepository = $documentRepository;
        $this->documentMetaDataRepository = $documentMetaDataRepository;
        $this->userNotificationRepository = $userNotificationRepository;
        $this->documenTokenRepository = $documenTokenRepository;
        $this->archiveDocumentRepository = $archiveDocumentRepository;
        $this->documentShareableLinkRepository = $documentShareableLinkRepository;
    }

    public function getDocuments(Request $request)
    {
        $queryString = (object) $request->all();

        $count = $this->documentRepository->getDocumentsCount($queryString);
        return response()->json($this->documentRepository->getDocuments($queryString))
            ->withHeaders(['totalCount' => $count, 'pageSize' => $queryString->pageSize, 'skip' => $queryString->skip]);
    }

    public function officeviewer(Request $request, $id)
    {
        $documentToken = $this->documenTokenRepository->getDocumentPathByToken($id, $request);

        if ($documentToken == null) {
            return response()->json([
                'message' => 'Document Not Found.',
            ], 404);
        }

        $isPublic = filter_var($request->input('isPublic'), FILTER_VALIDATE_BOOLEAN);
        $isFileRequest = filter_var($request->input('isFileRequest'), FILTER_VALIDATE_BOOLEAN);

        if ($isPublic == true) {
            return $this->downloadSharedDocument($request, $id);
        } else if ($isFileRequest == true) {
            return $this->downloadFileRequestDocument($id);
        } else {
            return $this->downloadDocument($id, $request->input('isVersion'));
        }
    }

    public function downloadSharedDocument(Request $request, $id)
    {
        $password = '';

        if ($request->has('password')) {
            $password = $request->input('password');
        }
        $documentSharableLink = $this->documentShareableLinkRepository->getByCode($id);
        if ($documentSharableLink == null) {
            return response()->json(['error' => ['message' => 'Link Expired.']], 404);
        }
        if (!empty($documentSharableLink->password) && base64_decode($documentSharableLink->password) != $password) {
            return response()->json(['error' => ['message' => 'Password is incorrect']], 404);
        }
        return $this->downloadDocument($documentSharableLink->documentId, false);
    }

    public function downloadDocument($id, $isVersion)
    {
        $bool = filter_var($isVersion, FILTER_VALIDATE_BOOLEAN);
        if ($bool == true) {
            $file = DocumentVersions::withoutGlobalScope('isDeleted')->withTrashed()->findOrFail($id);
        } else {
            $file = Documents::withoutGlobalScope('isDeleted')->withTrashed()->findOrFail($id);
        }

        $fileupload = $file->url;
        $location = $file->location ?? 'local';

        try {
            if (Storage::disk($location)->exists($fileupload)) {
                $file_contents = Storage::disk($location)->get($fileupload);
                $fileType = Storage::mimeType($fileupload);

                $fileExtension = explode('.', $file->url);

                return response($file_contents)
                    ->header('Cache-Control', 'no-cache private')
                    ->header('Content-Description', 'File Transfer')
                    ->header('Content-Type', $fileType)
                    ->header('Content-length', strlen($file_contents))
                    ->header('Content-Disposition', 'attachment; filename=' . $file->name . '.' . $fileExtension[1])
                    ->header('Content-Transfer-Encoding', 'binary');
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function readSharedTextDocument(Request $request, $id)
    {
        $documentSharableLink = $this->documentShareableLinkRepository->getByCode($id);
        if ($documentSharableLink == null) {
            return response()->json(['error' => ['message' => 'Link Expired.']], 404);
        }
        if (!empty($documentSharableLink->password) && base64_decode($documentSharableLink->password) != $request['password']) {
            return response()->json(['error' => ['message' => 'Password is incorrect']], 404);
        }
        return $this->readTextDocument($documentSharableLink->documentId, false);
    }

    public function readTextDocument($id, $isVersion)
    {
        $bool = filter_var($isVersion, FILTER_VALIDATE_BOOLEAN);
        if ($bool == true) {
            $file = DocumentVersions::withoutGlobalScope('isDeleted')->withTrashed()->findOrFail($id);
        } else {
            $file = Documents::withoutGlobalScope('isDeleted')->withTrashed()->findOrFail($id);
        }

        $fileupload = $file->url;
        $location = $file->location ?? 'local';

        if (Storage::disk($location)->exists($fileupload)) {
            $file_contents = Storage::disk($location)->get($fileupload);
            $response = ["result" => [$file_contents]];
            return response($response);
        }
    }

    public function saveDocument(Request $request)
    {
        $model = Documents::where([
            ['name', '=', $request->name],
            ['categoryId', '=', $request->categoryId]
        ])->first();

        if (!is_null($model)) {
            return response()->json([
                'message' => 'Document already exist with same name with same category.',
            ], 409);
        }

        $validator = Validator::make($request->all(), [
            'name'       => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json($validator->messages(), 409);
        }

        if (!$request->file('uploadFile')->isValid()) {
            return response()->json([
                'message' => 'Error: ' . $request->file('uploadFile')->getErrorMessage(),
            ], 409);
        }

        $location = $request->location ?? 'local';
        $fileSize = $request->file('uploadFile')->getSize();

        try {

            if ($location == 's3') {
                $s3Key = config('filesystems.disks.s3.key');
                $s3Secret = config('filesystems.disks.s3.secret');
                $s3Region = config('filesystems.disks.s3.region');
                $s3Bucket = config('filesystems.disks.s3.bucket');

                if (empty($s3Key) || empty($s3Secret) || empty($s3Region) || empty($s3Bucket)) {
                    return response()->json([
                        'message' => 'Error: S3 configuration is missing',
                    ], 409);
                }
            }

            $path = $request->file('uploadFile')->storeAs(
                'documents',
                Uuid::uuid4() . '.' . $request->file('uploadFile')->getClientOriginalExtension(),
                $location
            );
            if ($path == null || $path == '') {
                return response()->json([
                    'message' => 'Error in storing document in ' . $location,
                ], 409);
            }

            // Process attachments
            $attachmentPaths = [];
            if ($request->hasFile('attachments')) {
                foreach ($request->file('attachments') as $index => $attachmentFile) {
                    if ($attachmentFile->isValid()) {
                        $attachmentLocation = $request->input("attachmentLocations.$index") ?? $location;

                        // Check S3 configuration if using S3
                        if ($attachmentLocation == 's3') {
                            $s3Key = config('filesystems.disks.s3.key');
                            $s3Secret = config('filesystems.disks.s3.secret');
                            $s3Region = config('filesystems.disks.s3.region');
                            $s3Bucket = config('filesystems.disks.s3.bucket');

                            if (empty($s3Key) || empty($s3Secret) || empty($s3Region) || empty($s3Bucket)) {
                                continue; // Skip this attachment if S3 config is missing
                            }
                        }

                        $attachmentPath = $attachmentFile->storeAs(
                            'document-attachments',
                            Uuid::uuid4() . '.' . $attachmentFile->getClientOriginalExtension(),
                            $attachmentLocation
                        );

                        if ($attachmentPath) {
                            $attachmentPaths[] = [
                                'path' => $attachmentPath,
                                'name' => $request->input("attachmentNames.$index"),
                                'extension' => $request->input("attachmentExtensions.$index"),
                                'location' => $attachmentLocation
                            ];
                        }
                    }
                }
            }
        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Error in storing document in ' . $location,
            ], 409);
        }
        return $this->documentRepository->saveDocument($request, $path, $fileSize, $attachmentPaths);
    }

    public function updateDocument(Request $request, $id)
    {
        $model = Documents::where([['name', '=', $request->name], ['categoryId', '=', $request->categoryId], ['id', '<>', $id]])->first();

        if (!is_null($model)) {
            return response()->json([
                'message' => 'Document already exist.',
            ], 409);
        }
        return  response()->json($this->documentRepository->updateDocument($request, $id), 200);
    }

    public function archiveDocument($id)
    {
        return $this->documentRepository->archiveDocument($id);
    }

    public function deleteDocument($id)
    {
        return $this->archiveDocumentRepository->deleteDocument($id);
    }

    public function getDocumentMetatags($id)
    {
        return  response($this->documentMetaDataRepository->getDocumentMetadatas($id), 200);
    }

    public function assignedDocuments(Request $request)
    {
        $queryString = (object) $request->all();

        $count = $this->documentRepository->assignedDocumentsCount($queryString);
        return response()->json($this->documentRepository->assignedDocuments($queryString))
            ->withHeaders(['totalCount' => $count, 'pageSize' => $queryString->pageSize, 'skip' => $queryString->skip]);
    }

    public function getDocumentsByCategoryQuery()
    {
        return response()->json($this->documentRepository->getDocumentByCategory());
    }

    public function getDocumentbyId($id)
    {
        return response()->json($this->documentRepository->getDocumentbyId($id));
    }

    public function getDeepSearchDocuments(Request $request)
    {
        $queryString = (object) $request->all();
        return response()->json($this->documentRepository->getDeepSearchDocuments($queryString));
    }

    public function addDOocumentToDeepSearch($id)
    {
        return response()->json($this->documentRepository->addDOocumentToDeepSearch($id));
    }

    public function removeDocumentFromDeepSearch($id)
    {
        return response()->json($this->documentRepository->removeDocumentFromDeepSearch($id));
    }

    public function downloadFileRequestDocument($id)
    {
        $file = FileRequestDocuments::findOrFail($id);

        $fileupload = $file->url;
        $location = 'local';

        try {
            if (Storage::disk($location)->exists($fileupload)) {
                $file_contents = Storage::disk($location)->get($fileupload);
                $fileType = Storage::mimeType($fileupload);

                $fileExtension = explode('.', $file->url);

                return response($file_contents)
                    ->header('Cache-Control', 'no-cache private')
                    ->header('Content-Description', 'File Transfer')
                    ->header('Content-Type', $fileType)
                    ->header('Content-length', strlen($file_contents))
                    ->header('Content-Disposition', 'attachment; filename=' . $file->name . '.' . $fileExtension[1])
                    ->header('Content-Transfer-Encoding', 'binary');
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Delete a document attachment
     *
     * @param string $id The ID of the attachment to delete
     * @return \Illuminate\Http\Response
     */
    public function deleteAttachment($id)
    {
        return $this->documentRepository->deleteAttachment($id);
    }

    /**
     * Add attachments to an existing document
     *
     * @param \Illuminate\Http\Request $request The request containing attachment files
     * @param string $id The ID of the document to add attachments to
     * @return \Illuminate\Http\Response
     */
    public function addAttachment(Request $request, $id)
    {
        return $this->documentRepository->addAttachment($id, $request);
    }
}
