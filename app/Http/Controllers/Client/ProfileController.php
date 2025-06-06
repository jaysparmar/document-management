<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Clients;
use App\Helpers\ClientHelper;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    /**
     * Display client profile
     */
    public function index()
    {
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        $client = ClientHelper::getAuthClient();

        return view('client.profile.index', compact('client'));
    }

    /**
     * Show the form for editing profile
     */
    public function edit()
    {
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        $client = ClientHelper::getAuthClient();

        return view('client.profile.edit', compact('client'));
    }

    /**
     * Update client profile
     */
    public function update(Request $request)
    {
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        $client = ClientHelper::getAuthClient();

        $validator = Validator::make($request->all(), [
            'companyName' => 'required|string|max:255',
            'contactPerson' => 'required|string|max:255',
            'email' => [
                'required',
                'email',
                Rule::unique('clients')->ignore($client->id),
            ],
            'phoneNumber' => 'required|string|max:20',
            'address' => 'required|string|max:500',
            'current_password' => 'nullable|required_with:new_password',
            'new_password' => 'nullable|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput();
        }

        try {
            // Check current password if trying to change password
            if ($request->filled('current_password')) {
                if (!Hash::check($request->current_password, $client->password)) {
                    return redirect()
                        ->back()
                        ->withErrors(['current_password' => 'The current password is incorrect.'])
                        ->withInput();
                }
            }

            // Update basic info without triggering model events
            Clients::where('id', $client->id)->update([
                'companyName' => $request->companyName,
                'contactPerson' => $request->contactPerson,
                'email' => $request->email,
                'phoneNumber' => $request->phoneNumber,
                'address' => $request->address,
                'modifiedDate' => now()
            ]);

            // Update password if provided
            if ($request->filled('new_password')) {
                Clients::where('id', $client->id)->update([
                    'password' => Hash::make($request->new_password),
                    'modifiedDate' => now()
                ]);
            }

            return redirect()
                ->route('client-portal.profile.index')
                ->with('success', 'Profile updated successfully');
        } catch (\Exception $e) {
            return redirect()
                ->back()
                ->with('error', 'Failed to update profile. Please try again.')
                ->withInput();
        }
    }

    /**
     * Get client document statistics
     */
    public function getStats()
    {
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        $client = ClientHelper::getAuthClient();

        $stats = [
            'total_documents' => $client->documents()->count(),
            'pending_documents' => $client->documents()
                ->whereHas('documentStatus', function ($query) {
                    $query->where('name', 'Pending');
                })->count(),
            'approved_documents' => $client->documents()
                ->whereHas('documentStatus', function ($query) {
                    $query->where('name', 'Approved');
                })->count(),
            'storage_used' => $client->documents()->sum('fileSize')
        ];

        return response()->json($stats);
    }

    /**
     * Change client password
     */
    public function changePassword(Request $request)
    {
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'new_password' => 'required|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $client = ClientHelper::getAuthClient();

        if (!Hash::check($request->current_password, $client->password)) {
            return response()->json([
                'success' => false,
                'errors' => ['current_password' => ['The current password is incorrect.']]
            ], 422);
        }

        try {
            $client->update([
                'password' => $request->new_password
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Password changed successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to change password'
            ], 500);
        }
    }
}
