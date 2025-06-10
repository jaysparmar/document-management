@extends('client.layouts.app')
@section('title', 'My Meetings')
@section('content')
<div class="container-fluid py-4">
    <!-- Meetings Table -->
    <div class="card">
        <div class="card-header pb-0">
            <div class="row">
                <div class="col-lg-6 col-7">
                    <h6>My Meetings</h6>
                    <p class="text-sm mb-0">
                        <i class="fa fa-calendar text-info" aria-hidden="true"></i>
                        <span class="font-weight-bold ms-1">All scheduled meetings</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table align-items-center mb-0">
                <thead>
                    <tr>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Description</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Start Time</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">End Time</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Created By</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Status</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Actions</th>
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
                                    <span class="badge badge-sm bg-gradient-success">Accepted</span>
                                @else
                                    <span class="badge badge-sm bg-gradient-warning">Pending</span>
                                @endif
                            </td>
                            <td class="align-middle">
                                <div class="d-flex">
                                    <a href="{{ route('client-portal.meetings.show', $meeting->id) }}"
                                       class="btn btn-link text-info text-gradient px-3 mb-0">
                                        <i class="fas fa-eye me-2"></i>View
                                    </a>

                                    @if(!$meeting->pivot->is_accepted)
                                        <form action="{{ route('client-portal.meetings.accept', $meeting->id) }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-link text-success text-gradient px-3 mb-0">
                                                <i class="fas fa-check me-2"></i>Accept
                                            </button>
                                        </form>
                                    @endif
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center py-4">
                                No meetings found
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
