@extends('client.layouts.app')
@section('title', __('client.my_meetings'))
@section('content')
<div class="container-fluid py-4">
    <!-- Meetings Table -->
    <div class="card">
        <div class="card-header pb-0">
            <div class="row">
                <div class="col-lg-6 col-7">
                    <h6>{{ __('client.my_meetings') }}</h6>
                    <p class="text-sm mb-0">
                        <i class="fa fa-calendar text-info" aria-hidden="true"></i>
                        <span class="font-weight-bold ms-1">{{ __('client.all_scheduled_meetings') }}</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table align-items-center mb-0">
                <thead>
                    <tr>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">{{ __('client.meeting_title') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">{{ __('client.description') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.start_time') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.end_time') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.created_by') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.status') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($meetings as $meeting)
                        <tr>
                            <td>
                                <div class="d-flex px-2 py-1">
                                    <div>
                                        <i class="fas fa-video text-primary text-lg me-3"></i>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center">
                                        <h6 class="mb-0 text-sm">{{ $meeting->title }}</h6>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">{{ $meeting->description ?? '-' }}</span>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">
                                    {{ $meeting->start_time->format('d M Y H:i') }}
                                </span>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">
                                    {{ $meeting->end_time->format('d M Y H:i') }}
                                </span>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">
                                    {{ $meeting->creator->firstName ?? '' }} {{ $meeting->creator->lastName ?? '' }}
                                </span>
                            </td>
                            <td>
                                @if($meeting->pivot->is_accepted)
                                    <span class="badge badge-sm bg-gradient-success">{{ __('client.accepted') }}</span>
                                @else
                                    <span class="badge badge-sm bg-gradient-warning">{{ __('client.pending') }}</span>
                                @endif
                            </td>
                            <td class="align-middle">
                                <div class="d-flex">
                                    <a href="{{ route('client-portal.meetings.show', $meeting->id) }}"
                                       class="btn btn-link text-info text-gradient px-3 mb-0">
                                        <i class="fas fa-eye me-2"></i>View
                                    </a>

                                    @if($meeting->pivot->is_accepted)
                                        <a href="{{ route('client-portal.meetings.join', $meeting->id) }}"
                                           class="btn btn-link text-primary text-gradient px-3 mb-0">
                                            <i class="fas fa-video me-2"></i>{{ __('client.join') }}
                                        </a>
                                    @else
                                        <form action="{{ route('client-portal.meetings.accept', $meeting->id) }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-link text-success text-gradient px-3 mb-0">
                                                <i class="fas fa-check me-2"></i>{{ __('client.accept') }}
                                            </button>
                                        </form>
                                    @endif
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center py-4">
                                {{ __('client.no_meetings') }}
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
