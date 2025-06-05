<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\ClientHelper;
use App\Models\Documents;
use App\Models\Categories;
use App\Models\DocumentStatus;
use Illuminate\Support\Facades\DB;

class DocumentController extends Controller
{
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
        //
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
}
