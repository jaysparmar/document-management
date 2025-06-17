@extends('client.layouts.app')

@section('title', $meeting->title)

@section('content')
    <div class="container-fluid py-4">
    <!-- Meeting Header Card -->
    <div class="card mb-4">
        <div class="card-body">
            <div class="row align-items-center">
                <div class="col-auto">
                    <div class="icon bg-gradient-primary rounded-circle d-flex align-items-center justify-content-center text-white shadow"
                        style="width: 48px; height: 48px;">
                        <i class="fas fa-video"></i>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5 class="mb-0">{{ $meeting->title }}</h5>
                    <p class="text-muted mb-0 text-sm">
                        <i class="fas fa-user me-1"></i> {{ __('client.created_by') }}: {{ $meeting->creator->firstName ?? '' }} {{ $meeting->creator->lastName ?? '' }}
                    </p>
                </div>
                <div class="col-md-4 text-md-end">
                    @if($meeting->pivot->is_accepted)
                        <span class="badge bg-gradient-success mb-2">{{ __('client.accepted') }}</span>
                        <div class="mt-2">
                            <a href="{{ route('client-portal.meetings.join', $meeting->id) }}" class="btn btn-sm btn-primary">
                                <i class="fas fa-video me-2"></i>{{ __('client.join_meeting') }}
                            </a>
                        </div>
                    @else
                        <span class="badge bg-gradient-warning mb-2">{{ __('client.pending') }}</span>
                        <form action="{{ route('client-portal.meetings.accept', $meeting->id) }}" method="POST" class="mt-2">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-success">
                                <i class="fas fa-check me-2"></i>{{ __('client.accept_meeting') }}
                            </button>
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <!-- Meeting Details -->
    <div class="card">
        <div class="card-header pb-0">
            <h6 class="mb-0">{{ __('client.meeting_details') }}</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    @if ($meeting->description)
                        <div class="mb-4">
                            <h6 class="text-muted mb-2 text-sm">{{ __('client.description') }}</h6>
                            <p class="text-sm">{{ $meeting->description }}</p>
                        </div>
                    @endif

                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="rounded-3 border p-3">
                                <h6 class="mb-2 text-sm">{{ __('client.start_time') }}</h6>
                                <p class="mb-0 text-sm">
                                    <i class="fas fa-calendar-alt text-primary me-2"></i>
                                    {{ $meeting->start_time->format('d M Y H:i') }}
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="rounded-3 border p-3">
                                <h6 class="mb-2 text-sm">{{ __('client.end_time') }}</h6>
                                <p class="mb-0 text-sm">
                                    <i class="fas fa-calendar-alt text-primary me-2"></i>
                                    {{ $meeting->end_time->format('d M Y H:i') }}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="rounded-3 bg-gray-100 p-4">
                        <h6 class="mb-3">{{ __('client.meeting_info') }}</h6>
                        <ul class="list-unstyled mb-0">
                            <li class="mb-3">
                                <span class="text-muted text-sm">{{ __('client.status') }}</span>
                                <p class="font-weight-bold mb-0 text-sm">
                                    @if($meeting->pivot->is_accepted)
                                        <span class="text-success">{{ __('client.accepted') }}</span>
                                    @else
                                        <span class="text-warning">{{ __('client.pending') }}</span>
                                    @endif
                                </p>
                            </li>
                            <li class="mb-3">
                                <span class="text-muted text-sm">{{ __('client.meeting_id') }}</span>
                                <p class="font-weight-bold mb-0 text-sm">{{ $meeting->jitsi_meeting_id ?? 'N/A' }}</p>
                            </li>
                            <li class="mb-3">
                                <span class="text-muted text-sm">{{ __('client.created_on') }}</span>
                                <p class="font-weight-bold mb-0 text-sm">{{ $meeting->created_at->format('d M Y H:i') }}</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-12">
                    <a href="{{ route('client-portal.meetings.index') }}" class="btn btn-secondary">
                        <i class="fas fa-arrow-left me-2"></i>{{ __('client.back_to_meetings') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
