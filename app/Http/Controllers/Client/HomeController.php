<?php

namespace App\Http\Controllers\Client;

use App\Models\Documents;
use Illuminate\Http\Request;
use App\Helpers\ClientHelper;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get document statistics
        $documentStats = ClientHelper::getDocumentStats();

        // Get recent documents with filters
        $recentDocuments = ClientHelper::getClientDocuments([
            'limit' => 5,
            'orderBy' => 'createdDate'
        ]);

        // Get Last Week's Documents Count
        // Fetch documents created in the last week for the authenticated client
        $lastWeekDocuments = Documents::where('clientId', $client->id)
            ->where('createdDate', '>=', now()->subWeek())
            ->count();
        $documentStats['lastWeekCount'] = $lastWeekDocuments;
        // Get Last Month's Documents Count
        $lastMonthDocuments = Documents::where('clientId', $client->id)
            ->where('createdDate', '>=', now()->subMonth())
            ->count();
        $documentStats['lastMonthCount'] = $lastMonthDocuments;
        // Get Last Year's Documents Count
        $lastYearDocuments = Documents::where('clientId', $client->id)
            ->where('createdDate', '>=', now()->subYear())
            ->count();
        $documentStats['lastYearCount'] = $lastYearDocuments;

        // Group documents by category
        $documentsByCategory = Documents::where('clientId', $client->id)
            ->selectRaw('categoryId, count(*) as count')
            ->groupBy('categoryId')
            ->with('categories')
            ->get();

        // Add monthly uploads data
        $monthlyUploads = Documents::where('clientId', $client->id)
            ->selectRaw('MONTH(createdDate) as month, COUNT(*) as count')
            ->whereYear('createdDate', date('Y'))
            ->groupBy('month')
            ->get()
            ->pluck('count', 'month')
            ->toArray();

        // Fill in missing months with zero
        $documentStats['monthly_uploads'] = array_replace(
            array_fill(1, 12, 0),
            $monthlyUploads
        );

        // Get recent activities
        $documentStats['recent_activities'] = Documents::where('clientId', $client->id)
            ->with(['documentAuditTrails' => function ($query) {
                $query->latest('createdDate')->limit(5);
            }])
            ->latest('createdDate')
            ->limit(5)
            ->get();

        $documents = Documents::where('clientId', $client->id)->get();
        $documentStats['storage_used'] = $documents->reduce(function ($carry, $doc) {
            try {
                if ($doc->url && Storage::disk('local')->exists($doc->url)) {
                    return $carry + Storage::disk('local')->size($doc->url);
                }
                return $carry;
            } catch (\Exception $e) {
                return $carry;
            }
        }, 0);
        return view('client.dashboard', compact(
            'client',
            'documentStats',
            'recentDocuments',
            'documentsByCategory'
        ));
    }

    /**
     * Show the document details
     */
    public function show(string $id)
    {
        if (!ClientHelper::hasDocumentPermission($id)) {
            return response()->json([
                'error' => true,
                'message' => 'You do not have permission to view this document'
            ], 403);
        }

        $document = ClientHelper::getDocumentDetails($id);

        if (!$document) {
            return response()->json([
                'error' => true,
                'message' => 'Document not found'
            ], 404);
        }

        return view('client.documents.show', compact('document'));
    }

    /**
     * Update client profile
     */
    public function updateProfile(Request $request)
    {
        $client = ClientHelper::getAuthClient();

        $validated = $request->validate([
            'companyName' => 'required|string|max:255',
            'contactPerson' => 'required|string|max:255',
            'phoneNumber' => 'required|string|max:20',
            'address' => 'required|string'
        ]);

        $client->update($validated);

        return response()->json([
            'error' => false,
            'message' => 'Profile updated successfully'
        ]);
    }

    /**
     * Show client analytics
     */
    public function analytics()
    {
        $client = ClientHelper::getAuthClient();

        $monthlyStats = Documents::where('clientId', $client->id)
            ->selectRaw('MONTH(createdDate) as month, count(*) as count')
            ->whereYear('createdDate', date('Y'))
            ->groupBy('month')
            ->get();

        $categoryStats = Documents::where('clientId', $client->id)
            ->with('categories')
            ->get()
            ->groupBy('categoryId');

        return view('client.analytics', compact(
            'monthlyStats',
            'categoryStats'
        ));
    }
}
