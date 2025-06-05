<?php

namespace App\Helpers;

use App\Models\Documents;
use App\Models\Clients;
use App\Models\Categories;
use App\Models\DocumentStatus;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Collection;
use Carbon\Carbon;

class ClientHelper
{
    /**
     * Get the authenticated client
     *
     * @return Clients|null
     */
    public static function getAuthClient()
    {
        return Auth::guard('client')->user();
    }

    /**
     * Check if client is authenticated
     *
     * @return boolean
     */
    public static function isAuthenticated()
    {
        return Auth::guard('client')->check();
    }

    /**
     * Get client by ID
     *
     * @param string $id
     * @return Clients|null
     */
    public static function getClientById($id)
    {
        return Clients::find($id);
    }

    /**
     * Get client by email
     *
     * @param string $email
     * @return Clients|null
     */
    public static function getClientByEmail($email)
    {
        return Clients::where('email', $email)->first();
    }

    /**
     * Check if client has specific attributes
     *
     * @param array $attributes
     * @return boolean
     */
    public static function hasAttributes($attributes)
    {
        $client = self::getAuthClient();
        if (!$client) return false;

        foreach ($attributes as $attribute) {
            if (!$client->{$attribute}) return false;
        }
        return true;
    }

    /**
     * Get all documents for the authenticated client with various relationships
     *
     * @param array $filters Optional filters
     * @return Collection
     */
    public static function getClientDocuments(array $filters = [])
    {
        $client = self::getAuthClient();
        if (!$client) return collect();

        $query = Documents::where('clientId', $client->id)
            ->with([
                'categories',
                'docuementStatus',
                'documentMetaDatas',
                'documentVersions',
                'documentAttachments'
            ]);

        // Apply filters
        if (isset($filters['categoryId'])) {
            $query->where('categoryId', $filters['categoryId']);
        }

        if (isset($filters['statusId'])) {
            $query->where('statusId', $filters['statusId']);
        }

        if (isset($filters['isIndexed'])) {
            $query->where('isIndexed', $filters['isIndexed']);
        }

        if (isset($filters['search'])) {
            $query->where(function($q) use ($filters) {
                $q->where('name', 'like', "%{$filters['search']}%")
                  ->orWhere('description', 'like', "%{$filters['search']}%");
            });
        }

        return $query->latest('createdDate')->get();
    }

    /**
     * Upload new document for client
     *
     * @param array $data Document data
     * @param \Illuminate\Http\UploadedFile $file
     * @return Documents|null
     */
    public static function uploadDocument(array $data, $file)
    {
        $client = self::getAuthClient();
        if (!$client) return null;

        // Generate unique filename
        $filename = uniqid() . '_' . $file->getClientOriginalName();

        // Store file
        $path = $file->storeAs(
            'client_documents/' . $client->id,
            $filename,
            'private'
        );

        // Create document record
        return Documents::create([
            'categoryId' => $data['categoryId'],
            'name' => $data['name'],
            'description' => $data['description'] ?? null,
            'url' => $path,
            'location' => $path,
            'clientId' => $client->id,
            'statusId' => $data['statusId'] ?? DocumentStatus::where('name', 'Pending')->first()->id,
            'isIndexed' => $data['isIndexed'] ?? false,
            'isDeleted' => false,
            'isPermanentDelete' => false
        ]);
    }

    /**
     * Get document statistics with audit trails
     *
     * @return array
     */
    public static function getDocumentStats()
    {
        $client = self::getAuthClient();
        if (!$client) return [];

        $documents = Documents::where('clientId', $client->id);

        return [
            'total_documents' => $documents->count(),
            'by_status' => Documents::where('clientId', $client->id)
                ->join('documentStatus', 'documents.statusId', '=', 'documentStatus.id')
                ->selectRaw('documents.statusId, documentStatus.name as status_name, count(*) as count')
                ->groupBy('documents.statusId', 'documentStatus.name')
                ->get()
                ->mapWithKeys(function ($item) {
                    return [
                        $item->statusId => [
                            'count' => $item->count,
                            'name' => $item->status_name
                        ]
                    ];
                }),
            'by_category' => Documents::where('clientId', $client->id)
                ->selectRaw('categoryId, count(*) as count')
                ->groupBy('categoryId')
                ->get()
                ->pluck('count', 'categoryId'),
            'recent_activities' => Documents::where('clientId', $client->id)
                ->with(['documentAuditTrails' => function($query) {
                    $query->latest('createdDate')->limit(5);
                }])
                ->latest('modifiedDate')
                ->limit(5)
                ->get(),
            // 'total_size' => $documents->sum(function($doc) {
            //     return Storage::disk('private')->size($doc->url);
            // }),
        ];
    }

    /**
     * Get document with all its relationships
     *
     * @param string $documentId
     * @return Documents|null
     */
    public static function getDocumentDetails($documentId)
    {
        $client = self::getAuthClient();
        if (!$client) return null;

        return Documents::where('clientId', $client->id)
            ->with([
                'categories',
                'docuementStatus',
                'documentMetaDatas',
                'documentComments',
                'documentVersions',
                'documentAttachments',
                'documentAuditTrails',
                'reminderSchedulers',
                'reminders'
            ])
            ->find($documentId);
    }

    /**
     * Add comment to document
     *
     * @param string $documentId
     * @param string $comment
     * @return DocumentComments|null
     */
    public static function addDocumentComment($documentId, $comment)
    {
        $document = self::getDocumentDetails($documentId);
        if (!$document) return null;

        return $document->documentComments()->create([
            'comment' => $comment,
            'createdBy' => self::getAuthClient()->id
        ]);
    }

    /**
     * Check if client has permission to access document
     *
     * @param string $documentId
     * @param string $permission
     * @return boolean
     */
    public static function hasDocumentPermission($documentId, $permission = 'view')
    {
        $client = self::getAuthClient();
        if (!$client) return false;

        $document = Documents::where('clientId', $client->id)
            ->where('id', $documentId)
            ->first();

        return $document !== null;
    }
}
