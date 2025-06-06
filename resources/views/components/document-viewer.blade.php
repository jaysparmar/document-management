<div class="document-viewer">
    @if(pathinfo($url, PATHINFO_EXTENSION) === 'pdf')
        <iframe src="{{ asset('storage/' . $url) }}#toolbar=0" class="w-100 h-100" frameborder="0"></iframe>
    @elseif(in_array(pathinfo($url, PATHINFO_EXTENSION), ['jpg', 'jpeg', 'png', 'gif']))
        <img src="{{ asset('storage/' . $url) }}" class="img-fluid" alt="Document Preview">
    @elseif(in_array(pathinfo($url, PATHINFO_EXTENSION), ['doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx']))
        <iframe src="https://view.officeapps.live.com/op/embed.aspx?src={{ urlencode(asset('storage/' . $url)) }}" class="w-100 h-100" frameborder="0"></iframe>
    @else
        <div class="text-center py-5">
            <i class="fas fa-file fa-3x text-muted mb-3"></i>
            <p class="mb-0">Preview not available for this file type.</p>
            <a href="{{ asset('storage/' . $url) }}" class="btn btn-sm btn-primary mt-3" download>
                <i class="fas fa-download me-2"></i>Download File
            </a>
        </div>
    @endif
</div>