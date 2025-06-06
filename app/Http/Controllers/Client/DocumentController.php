<?php

namespace App\Http\Controllers\Client;

use Carbon\Carbon;
use App\Models\Users;
use App\Models\Documents;
use App\Models\Categories;
use Illuminate\Http\Request;
use App\Helpers\ClientHelper;
use App\Models\DocumentStatus;
use App\Models\DocumentVersions;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Response;
use App\Repositories\Implementation\DocumentVersionsRepository;

class DocumentController extends Controller
{
    protected $documentVersionsRepository;

    public function __construct(DocumentVersionsRepository $documentVersionsRepository)
    {
        $this->documentVersionsRepository = $documentVersionsRepository;
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get filters from request
        $filters = [
            'search' => $request->get('search'),
            'category' => $request->get('category'),
            'status' => $request->get('status'),
            'date_from' => $request->get('date_from'),
            'date_to' => $request->get('date_to'),
        ];

        // Query builder
        $documents = Documents::where('clientId', $client->id)
            ->with(['categories', 'docuementStatus'])
            ->when($filters['search'], function($query, $search) {
                return $query->where('name', 'like', "%{$search}%");
            })
            ->when($filters['category'], function($query, $category) {
                return $query->where('categoryId', $category);
            })
            ->when($filters['status'], function($query, $status) {
                return $query->where('statusId', $status);
            })
            ->when($filters['date_from'], function($query, $date) {
                return $query->whereDate('createdDate', '>=', $date);
            })
            ->when($filters['date_to'], function($query, $date) {
                return $query->whereDate('createdDate', '<=', $date);
            })
            ->orderBy('createdDate', 'desc')
            ->paginate(10);

        // Get categories and statuses for filters
        $categories = Categories::all();
        $statuses = DocumentStatus::all();

        return view('client.documents.index', compact(
            'documents',
            'categories',
            'statuses',
            'filters'
        ));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        $client = ClientHelper::getAuthClient();

        // Get document with relations
        $document = Documents::where('clientId', $client->id)
            ->with([
                'categories',
                'docuementStatus',
                'users',
                'documentAuditTrails' => function ($query) {
                    $query->orderBy('createdDate', 'desc');
                },
                'documentComments' => function ($query) {
                    $query->orderBy('createdDate', 'desc')
                        ->with('user');
                }
            ])
            ->findOrFail($id);

        // Get versions using repository
        $versions = $this->documentVersionsRepository->getDocumentversion($id);

        // Calculate file size
        $fileSize = 0;
        if (Storage::disk($document->location ?? 'local')->exists($document->url)) {
            $fileSize = Storage::disk($document->location ?? 'local')->size($document->url);
        }

        $document = [
            'details' => [
                'id' => $document->id,
                'name' => $document->name,
                'description' => $document->description,
                'url' => $document->url,
                'fileSize' => $this->formatFileSize($fileSize),
                'category' => $document->categories->name,
                'status' => [
                    'name' => $document->docuementStatus->name,
                    'color' => $document->docuementStatus->colorCode ?? '#6ba6ff'
                ],
                'created' => [
                    'date' => $document->createdDate->format('M d, Y h:i A'),
                    'by' => $document->users->firstName . ' ' . $document->users->lastName ?? 'System'
                ],
                'modified' => [
                    'date' => $document->modifiedDate->format('M d, Y h:i A'),
                    'by' => $document->users->firstName . ' ' . $document->users->lastName ?? 'System'
                ]
            ],
            'versions' => collect($versions)->map(function ($version) {

                return [
                    'id' => $version['id'],
                    'documentId' => $version['id'],
                    'url' => $version['url'],
                    'isCurrentVersion' => $version['isCurrentVersion'] ?? false,
                    'modifiedDate' => Carbon::parse($version['modifiedDate'])->format('M d, Y h:i A'),
                    'createdBy' => $version['createdByUser'] ?? 'System'
                ];
            }),
            'activities' => $document->documentAuditTrails->map(function ($activity) {
                $user = Users::find($activity->createdBy);
                return [
                    'id' => $activity->id,
                    'operation' => $activity->operationName,
                    'date' => $activity->createdDate->format('M d, Y h:i A'),
                    'by' => $user ? $user->firstName . ' ' . $user->lastName : 'System',
                    'email' => $user ? $user->email : null,
                ];
            }),
            'comments' => $document->documentComments->map(function ($comment) {
                // dd($comment);
                $user = Users::find($comment->createdBy);
                return [
                    'id' => $comment->id,
                    'content' => $comment->comment,
                    'date' => $comment->createdDate->format('M d, Y h:i A'),
                    'user' => [
                        'name' => $user ? $user->firstName . ' ' . $user->lastName : 'System',
                        'avatar' => $user ? $user->avatar : null
                    ]
                ];
            })
        ];

        return view('client.documents.show', compact('document'));
    }

    private function formatFileSize($bytes)
    {
        if ($bytes >= 1073741824) {
            return number_format($bytes / 1073741824, 2) . ' GB';
        }
        if ($bytes >= 1048576) {
            return number_format($bytes / 1048576, 2) . ' MB';
        }
        if ($bytes >= 1024) {
            return number_format($bytes / 1024, 2) . ' KB';
        }
        if ($bytes > 1) {
            return $bytes . ' bytes';
        }
        if ($bytes == 1) {
            return $bytes . ' byte';
        }
        return '0 bytes';
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function viewDocument(Request $request)
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        $path = $request->input('path');
        if (!$path) {
            return response()->json([
                'success' => false,
                'message' => 'No file path provided.'
            ], 400);
        }

        $client = ClientHelper::getAuthClient();

        // Try to find the document by path and client
        $document = \App\Models\Documents::where('clientId', $client->id)
            ->where('url', $path)
            ->first();

        $documentId = null;

        if (!$document) {
            // Try to find in versions table if not found in main documents
            $documentVersion = \App\Models\DocumentVersions::where('url', $path)->first();

            if (!$documentVersion) {
                return response()->json([
                    'success' => false,
                    'message' => 'File not found.'
                ], 404);
            }

            $disk = $documentVersion->location ?? 'local';
            $filePath = $documentVersion->url;
            $documentId = $documentVersion->id;
        } else {
            $disk = $document->location ?? 'local';
            $filePath = $document->url;
            $documentId = $document->id;
        }

        // Check if the file exists
        if (!\Storage::disk($disk)->exists($filePath)) {
            return response()->json([
                'success' => false,
                'message' => 'File not found on disk.'
            ], 404);
        }

        // Get the file's MIME type and extension
        $mimeType = \Storage::disk($disk)->mimeType($filePath);
        $extension = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));

        // Prepare stream URL instead of public asset
        $streamUrl = route('client-portal.documents.stream', ['uuid' => $documentId]);

        return response()->json([
            'success' => true,
            'stream_url' => $streamUrl,
            'file_type' => $extension,
            'mime_type' => $mimeType,
            'file_name' => basename($filePath)
        ]);
    }


    public function streamDocument($uuid)
    {
        if (!ClientHelper::isAuthenticated()) {
            abort(401, 'Unauthorized');
        }

        $client = ClientHelper::getAuthClient();

        // Try main document first
        $document = \App\Models\Documents::where('clientId', $client->id)
            ->where('id', $uuid)
            ->first();

        if (!$document) {
            $document = \App\Models\DocumentVersions::where('id', $uuid)->first();
            if (!$document) {
                abort(404, 'Document not found');
            }
        }

        $disk = $document->location ?? 'local';
        $filePath = $document->url;

        if (!Storage::disk($disk)->exists($filePath)) {
            abort(404, 'File not found');
        }

        $mimeType = Storage::disk($disk)->mimeType($filePath);
        $stream = Storage::disk($disk)->readStream($filePath);

        return response()->stream(function () use ($stream) {
            fpassthru($stream);
        }, 200, [
            'Content-Type' => $mimeType,
            'Content-Disposition' => 'inline; filename="' . basename($filePath) . '"',
        ]);
    }
}
