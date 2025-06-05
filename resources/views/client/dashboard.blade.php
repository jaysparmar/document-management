@extends('client.layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="container-fluid py-4">
    <!-- Add this at the top of your dashboard content -->

    <div  id="dashboard-charts-data"
    data-charts="{{ json_encode([
             'byStatus' => $documentStats['by_status'],
             'monthlyUploads' => $documentStats['monthly_uploads'],
             'categoryLabels' => $documentsByCategory->pluck('categories.name'),
             'categoryData' => $documentsByCategory->pluck('count')
         ]) }}">
    </div>

    <!-- Stats Cards Row -->
    <div class="row">
        <!-- Total Documents Card -->
        <div class="col-xl-3 col-sm-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold text-muted">Total Documents
                                </p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ $documentStats['total_documents'] }}
                                    <span class="text-primary text-sm font-weight-bolder">All</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                <i class="ni ni-folder-17 text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Last Week Documents Card -->
        <div class="col-xl-3 col-sm-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold text-muted">Last 7 Days</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ $documentStats['lastWeekCount'] }}
                                    <span class="text-success text-sm font-weight-bolder">Documents</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-success shadow text-center border-radius-md">
                                <i class="ni ni-calendar-grid-58 text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Last Month Documents Card -->
        <div class="col-xl-3 col-sm-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold text-muted">Last 30 Days</p>
                                <h5 class="font-weight-bolder mb-0>
                                    {{ $documentStats['lastMonthCount'] }}
                                    <span class="text-warning text-sm font-weight-bolder">Documents</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-warning shadow text-center border-radius-md">
                                <i class="ni ni-chart-bar-32 text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Last Year Documents Card -->
        <div class="col-xl-3 col-sm-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold text-muted">Last 365 Days</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ $documentStats['lastYearCount'] }}
                                    <span class="text-danger text-sm font-weight-bolder">Documents</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-danger shadow text-center border-radius-md">
                                <i class="ni ni-chart-pie-35 text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Row -->
    <div class="row mt-4">
        <div class="col-lg-8 mb-lg-0 mb-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Recent Documents</h6>
                </div>
                <div class="card-body p-3">
                    <div class="table-responsive">
                        <table class="table align-items-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Document
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                        Category</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                        Status</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                        Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($recentDocuments as $document)
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div>
                                                <i class="ni ni-single-copy-04 text-primary text-lg me-3"></i>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ $document->name }}</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">{{ $document->categories->name }}</span>
                                    </td>
                                    <td>
                                        <span class="badge badge-sm bg-gradient-{{ $document->docuementStatus->color }}">
                                            {{ $document->docuementStatus->name }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">
                                            {{ Carbon\Carbon::parse($document->createdDate)->format('d M Y') }}
                                        </span>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="4" class="text-center">No documents found</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Categories Distribution</h6>
                </div>
                <div class="card-body p-3">
                    @foreach($documentsByCategory as $category)
                    <div class="mb-3">
                        <div class="d-flex justify-content-between mb-1">
                            <span class="text-sm font-weight-bold">{{ $category->categories->name }}</span>
                            <span class="text-sm font-weight-bold">{{ $category->count }}</span>
                        </div>
                        <div class="progress">
                            @php
                            $percentage = ($category->count / $documentStats['total_documents']) * 100;
                            @endphp
                            <div class="progress-bar bg-gradient-primary" role="progressbar" style="width: {{ $percentage }}%"
                                aria-valuenow="{{ $percentage }}" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    <!-- Document Status Chart -->
    <div class="row mt-4">
        <div class="col-lg-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Documents by Status</h6>
                </div>
                <div class="card-body p-3">
                    <div class="chart">
                        <canvas id="statusChart" style="height: 300px;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Monthly Uploads Chart -->
        <div class="col-lg-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Monthly Document Uploads</h6>
                </div>
                <div class="card-body p-3">
                    <div class="chart">
                        <canvas id="monthlyUploadsChart" style="height: 300px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Document Activity Timeline -->
    <div class="row mt-4">
        <div class="col-lg-12 mb-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Recent Activity Timeline</h6>
                </div>
                <div class="card-body p-3">
                    <div class="timeline timeline-one-side">
                        @forelse($documentStats['recent_activities'] as $document)
                        <div class="timeline-block mb-3">
                            <span class="timeline-step">
                                <i class="ni ni-bell-55 text-success text-gradient"></i>
                            </span>
                            <div class="timeline-content">
                                <h6 class="text-dark text-sm font-weight-bold mb-0">

                                    {{ $document->name }}</h6>
                                <p class="text-secondary font-weight-bold text-xs mt-1 mb-0">
                                    {{ Carbon\Carbon::parse($document->createdDate)->format('d M Y H:i') }}
                                </p>
                                <p class="text-sm mt-3 mb-2">
                                    {{ $document->description }}
                                </p>
                            </div>
                        </div>
                        @empty
                        <p class="text-center">No recent activities</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Document Statistics Details -->
    <div class="row mt-4">
        <div class="col-lg-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Storage Statistics</h6>
                </div>
                <div class="card-body p-3">
                    <div class="progress-wrapper">
                        <div class="progress-info mb-4">
                            <div class="progress-percentage">
                                <span class="text-sm font-weight-bold">Storage Used</span>
                            </div>
                            @php
                                $storagePercentage = min(($documentStats['storage_used'] / (1024 * 1024 * 1024)) * 100, 100);
                            @endphp
                            <div class="progress">
                                <div class="progress-bar bg-gradient-info" role="progressbar"
                                     style="width: {{ $storagePercentage }}%"
                                     aria-valuenow="{{ $storagePercentage }}"
                                     aria-valuemin="0"
                                     aria-valuemax="100">
                                </div>
                            </div>
                            <small class="text-muted">
                                {{ number_format($documentStats['storage_used'] / (1024 * 1024), 2) }} MB used
                            </small>
                        </div>
                    </div>

                    <div class="document-stats mt-4">
                        <div class="row">
                            @foreach($documentStats['by_status'] as $statusId => $status)
                            <div class="col-6 mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="bg-gradient-primary shadow d-flex align-items-center justify-content-center"
                                         style="width: 48px; height: 48px; min-width: 48px; border-radius: 12px;">
                                        <i class="fas fa-file-alt text-white" style="font-size: 1.25rem;"></i>
                                    </div>
                                    <div class="ms-3">
                                        <p class="text-xs text-muted mb-1 mb-sm-0">{{ $status['name'] }}</p>
                                        <h6 class="font-weight-bolder mb-0 text-lg">
                                            {{ $status['count'] }}
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        @endforeach

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-header pb-0">
                    <h6 class="mb-0">Category Analytics</h6>
                </div>
                <div class="card-body p-3">
                    <div class="chart">
                        <canvas id="categoryPieChart" style="height: 300px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
@endsection
