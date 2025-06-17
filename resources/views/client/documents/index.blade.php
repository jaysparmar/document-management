@extends('client.layouts.app')
@section('title', __('client.my_documents'))
@section('content')
<div class="container-fluid py-4">
    <!-- Filters -->
    <div class="card mb-4">
        <div class="card-body p-3">
            <form action="{{ route('client-portal.documents.index') }}" method="GET">
                <div class="row">
                    <div class="col-md-3">
                        <input type="text" name="search" class="form-control" placeholder="{{ __('client.search_documents') }}" value="{{ $filters['search'] }}">
                    </div>
                    <div class="col-md-2">
                        <select name="category" class="form-select">
                            <option value="">{{ __('client.all_categories') }}</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ $filters['category'] == $category->id ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select name="status" class="form-select">
                            <option value="">{{ __('client.all_statuses') }}</option>
                            @foreach($statuses as $status)
                                <option value="{{ $status->id }}" {{ $filters['status'] == $status->id ? 'selected' : '' }}>
                                    {{ $status->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary">{{ __('client.filter') }}</button>
                        <a href="{{ route('client-portal.documents.index') }}" class="btn btn-outline-secondary">{{ __('client.reset') }}</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Documents Table -->
    <div class="card">
        <div class="table-responsive">
            <table class="table align-items-center mb-0">
                <thead>
                    <tr>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">{{ __('client.document') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">{{ __('client.description') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.category') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.status') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.date') }}</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">{{ __('client.actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($documents as $document)
                        <tr>
                            <td>
                                <div class="d-flex px-2 py-1">
                                    <div>
                                        <i class="fas fa-file-alt text-primary text-lg me-3"></i>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center">
                                        <h6 class="mb-0 text-sm">{{ $document->name }}</h6>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">{{ $document->description ?? '-' }}</span>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">{{ $document->categories->name }}</span>
                            </td>
                            <td>
                                <span class="badge badge-sm" style="background-color: {{ $document->docuementStatus->colorCode }}">
                                    {{ $document->docuementStatus->name }}
                                </span>
                            </td>
                            <td>
                                <span class="text-xs font-weight-bold">
                                    {{ $document->createdDate->format('d M Y') }}
                                </span>
                            </td>
                            <td class="align-middle">
                                <a href="{{ route('client-portal.documents.show', $document->id) }}"
                                   class="text-secondary font-weight-bold text-xs">
                                    {{ __('client.view') }}
                                </a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="text-center py-4">
                                {{ __('client.no_documents_found') }}
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <div class="card-footer py-3">
            <div class="d-flex justify-content-between align-items-center">
                <div class="text-sm text-muted">
                    {{ __('client.showing') }} {{ $documents->firstItem() ?? 0 }} {{ __('client.to') }} {{ $documents->lastItem() ?? 0 }} {{ __('client.of') }} {{ $documents->total() }} {{ __('client.documents') }}
                </div>
                @if($documents->hasPages())
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-sm mb-0 justify-content-end">
                            @foreach ($documents->getUrlRange(1, $documents->lastPage()) as $page => $url)
                                <li class="page-item {{ $page == $documents->currentPage() ? 'active' : '' }}">
                                    <a class="page-link" href="{{ $url }}">{{ $page }}</a>
                                </li>
                            @endforeach
                        </ul>
                    </nav>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
