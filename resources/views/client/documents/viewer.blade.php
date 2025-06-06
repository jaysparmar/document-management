@extends('client.layouts.app')

@section('content')
<div class="container-fluid py-4">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <h5 class="mb-0">{{ $filename }}</h5>
            <div class="ms-auto">
                <a href="{{ $downloadUrl }}" class="btn btn-primary btn-sm" download>
                    <i class="fas fa-download me-2"></i>Download
                </a>
            </div>
        </div>
        <div class="card-body p-0" style="height: 80vh;">
            @if(in_array($extension, config('file-viewer.google_viewer_formats')))
                <iframe src="https://view.officeapps.live.com/op/embed.aspx?src={{ urlencode($fileUrl) }}" 
                        width="100%" 
                        height="100%" 
                        frameborder="0">
                </iframe>
            @elseif(in_array($extension, config('file-viewer.stream_formats')))
                @if(in_array($extension, ['pdf']))
                    <embed src="{{ $fileUrl }}" 
                           type="application/pdf" 
                           width="100%" 
                           height="100%">
                @else
                    <img src="{{ $fileUrl }}" 
                         class="img-fluid" 
                         style="max-height: 100%; object-fit: contain;">
                @endif
            @else
                <div class="text-center py-5">
                    <i class="fas fa-file-alt fa-3x text-primary mb-3"></i>
                    <h5>Preview not available</h5>
                    <p class="text-muted">This file type cannot be previewed. Please download to view.</p>
                    <a href="{{ $downloadUrl }}" class="btn btn-primary mt-3" download>
                        <i class="fas fa-download me-2"></i>Download File
                    </a>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection