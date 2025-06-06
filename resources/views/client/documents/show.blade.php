@extends('client.layouts.app')

@section('title', $document['details']['name'])

@section('content')
    <div class="container-fluid py-4">
        <!-- Document Header Card -->
        <div class="card mb-4">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <div class="icon bg-gradient-primary rounded-circle d-flex align-items-center justify-content-center text-white shadow"
                            style="width: 48px; height: 48px;">
                            <i class="fas fa-file-alt"></i>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h5 class="mb-0">{{ $document['details']['name'] }}</h5>
                        <p class="text-muted mb-0 text-sm">{{ $document['details']['category'] }}</p>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <span class="badge bg-gradient-{{ $document['details']['status']['color'] }} mb-2">
                            {{ $document['details']['status']['name'] }}
                        </span>
                        <br>
                        <span class="text-muted text-sm">
                            <i class="fas fa-hdd me-1"></i> {{ $document['details']['fileSize'] }}
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content with Tabs -->
        <div class="card">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="details-tab" data-bs-toggle="tab" href="#details" role="tab">
                            <i class="fas fa-info-circle me-2"></i>Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="versions-tab" data-bs-toggle="tab" href="#versions" role="tab">
                            <i class="fas fa-code-branch me-2"></i>Versions
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="activity-tab" data-bs-toggle="tab" href="#activity" role="tab">
                            <i class="fas fa-history me-2"></i>Activity
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="comments-tab" data-bs-toggle="tab" href="#comments" role="tab">
                            <i class="fas fa-comments me-2"></i>Comments
                        </a>
                    </li>
                </ul>
            </div>

            <div class="card-body">
                <div class="tab-content">
                    <!-- Details Tab -->
                    <div class="tab-pane fade show active" id="details" role="tabpanel">
                        <div class="row">
                            <div class="col-md-8">
                                @if ($document['details']['description'])
                                    <div class="mb-4">
                                        <h6 class="text-muted mb-2 text-sm">Description</h6>
                                        <p class="text-sm">{{ $document['details']['description'] }}</p>
                                    </div>
                                @endif

                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="rounded-3 border p-3">
                                            <h6 class="mb-2 text-sm">Created</h6>
                                            <p class="mb-1 text-sm">
                                                <i class="fas fa-calendar-alt text-primary me-2"></i>
                                                {{ $document['details']['created']['date'] }}
                                            </p>
                                            <p class="mb-0 text-sm">
                                                <i class="fas fa-user text-primary me-2"></i>
                                                {{ $document['details']['created']['by'] }}

                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="rounded-3 border p-3">
                                            <h6 class="mb-2 text-sm">Last Modified</h6>
                                            <p class="mb-1 text-sm">
                                                <i class="fas fa-calendar-alt text-primary me-2"></i>
                                                {{ $document['details']['modified']['date'] }}
                                            </p>
                                            <p class="mb-0 text-sm">
                                                <i class="fas fa-user text-primary me-2"></i>
                                                {{ $document['details']['modified']['by'] }}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="rounded-3 bg-gray-100 p-4">
                                    <h6 class="mb-3">Document Information</h6>
                                    <ul class="list-unstyled mb-0">
                                        <li class="mb-3">
                                            <span class="text-muted text-sm">Status</span>
                                            <p class="font-weight-bold mb-0 text-sm">
                                                {{ $document['details']['status']['name'] }}
                                            </p>
                                        </li>
                                        <li class="mb-3">
                                            <span class="text-muted text-sm">Category</span>
                                            <p class="font-weight-bold mb-0 text-sm">
                                                {{ $document['details']['category'] }}
                                            </p>
                                        </li>
                                        <li>
                                            <span class="text-muted text-sm">File Size</span>
                                            <p class="font-weight-bold mb-0 text-sm">
                                                {{ $document['details']['fileSize'] }}
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Versions Tab -->
                    <div class="tab-pane fade" id="versions" role="tabpanel">
                        <div class="table-responsive">
                            <table class="align-items-center mb-0 table">
                                <thead>
                                    <tr>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Version</th>
                                        <th
                                            class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                            Modified</th>
                                        <th
                                            class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                            By</th>
                                        <th
                                            class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                            Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($document['versions'] as $version)
                                        {{-- @dd($version) --}}
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            @if ($version['isCurrentVersion'])
                                                                <span class="badge bg-gradient-success me-2">Current</span>
                                                            @else
                                                                <span
                                                                    class="badge bg-gradient-secondary me-2">Previous</span>
                                                            @endif
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="text-dark mb-0 text-xs">
                                                    {{ $version['modifiedDate'] }}
                                                </p>
                                            </td>
                                            <td>
                                                <p class="text-dark mb-0 text-xs">
                                                    {{ $version['createdBy'] }}
                                                </p>
                                            </td>
                                            <td>

                                                <button class="btn btn-link text-dark mb-0 px-3 view-document"
                                                    data-path="{{ $version['url'] }}">
                                                    <i class="fas fa-eye me-2"></i>View
                                                </button>


                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Activity Tab -->
                    <div class="tab-pane fade" id="activity" role="tabpanel">
                        <div class="timeline timeline-one-side">
                            @foreach ($document['activities'] as $activity)
                                <div class="timeline-block mb-3">
                                    <span class="timeline-step">
                                        <i class="fas fa-history text-primary"></i>
                                    </span>
                                    <div class="timeline-content">
                                        <h6 class="text-dark font-weight-bold mb-0 text-sm">
                                            {{ $activity['operation'] }}
                                        </h6>
                                        <p class="text-secondary font-weight-bold mb-0 mt-1 text-xs">
                                            {{ $activity['date'] }}
                                        </p>
                                        <p class="text-muted mb-0 mt-1 text-sm">
                                            by {{ $activity['by'] }} (
                                            <small>
                                                {{ $activity['email'] }}
                                            </small>)
                                        </p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <!-- Comments Tab -->
                    <div class="tab-pane fade" id="comments" role="tabpanel">


                        <div class="comments-section">
                            @foreach ($document['comments'] as $comment)
                                <div class="d-flex mb-4">
                                    <div class="flex-shrink-0">
                                        <div
                                            class="icon icon-shape bg-gradient-primary icon-sm rounded-circle d-flex align-items-center justify-content-center text-center shadow">
                                            <i class="fas fa-user text-white"></i>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <div class="d-flex align-items-center mb-1">
                                            <h6 class="mb-0">{{ $comment['user']['name'] }}</h6>
                                            <small class="text-muted ms-2">{{ $comment['date'] }}</small>
                                        </div>
                                        <p class="mb-0 text-sm">{{ $comment['content'] }}</p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Replace the existing modal content -->
    <div class="modal fade" id="documentViewerModal" tabindex="-1" aria-labelledby="documentViewerModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="documentViewerModalLabel"></h5>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-0" style="height: 80vh; overflow: hidden;">
                    <div id="documentViewerContent" class="h-100 position-relative">
                        <div class="loading-overlay position-absolute w-100 h-100 d-none">
                            <div class="d-flex justify-content-center align-items-center h-100">
                                <div class="spinner-border text-primary" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        </div>
                        <div id="viewerContainer" class="h-100 d-flex align-items-center justify-content-center">
                            <!-- Content will be dynamically inserted here -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="d-flex align-items-center">
                        <span id="loadingStatus" class="text-muted me-3"></span>
                        <a href="#" class="btn btn-primary download-btn" download>
                            <i class="fas fa-download me-1"></i> Download
                        </a>
                        <button type="button" class="btn btn-secondary ms-2" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('scripts')
        <script>
            // Initialize Bootstrap tabs
            var triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
            triggerTabList.forEach(function(triggerEl) {
                var tabTrigger = new bootstrap.Tab(triggerEl)
                triggerEl.addEventListener('click', function(event) {
                    event.preventDefault()
                    tabTrigger.show()
                })
            })
        </script>
    @endpush
@endsection
