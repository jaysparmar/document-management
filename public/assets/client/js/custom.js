if (typeof jQuery !== 'undefined') {
    console.log('jQuery is loaded!');
} else {
    console.log('jQuery is NOT loaded!');
}
if (typeof toastr !== 'undefined') {
    console.log('Toastr is loaded!');
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        "iconClasses": {
            error: 'bg-danger',
            info: 'bg-info',
            success: 'bg-success',
            warning: 'bg-warning'
        },
        "toastClass": "toast",
        "containerId": "toast-container",
    };
} else {
    console.log('Toastr is NOT loaded!');
}

$(document).ready(function() {
    // Set up CSRF token for all AJAX requests
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });



    $('.form-submit-event').on('submit', function(e) {
        e.preventDefault();

        let form = $(this);
        let submitBtn = form.find('button[type="submit"]');
        let originalBtnText = submitBtn.html();
        let shouldReload = form.data('reload') || false;
        let redirectUrl = form.find('input[name="redirect"]').val() || '';

        // Disable submit button and show loading state
        submitBtn.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Processing...').prop('disabled', true);

        $.ajax({
            url: form.attr('action'),
            type: form.attr('method') || 'POST',
            data: new FormData(this),
            processData: false,
            contentType: false,
            success: function(response) {
                if (response.error === false || response.success === true) {
                    // Success toast
                    toastr.success(response.message || 'Operation completed successfully');

                    // Handle redirect or reload
                    if (redirectUrl) {
                        setTimeout(() => {
                            window.location.href = redirectUrl;
                        }, 1000);
                    } else if (shouldReload) {
                        setTimeout(() => {
                            window.location.reload();
                        }, 1000);
                    } else {
                        // Reset form if no redirect/reload
                        form[0].reset();
                    }
                } else {
                    // Error toast
                    toastr.error(response.message || 'Something went wrong');
                }
            },
            error: function(xhr) {
                let errorMessage = 'Something went wrong';

                if (xhr.responseJSON) {
                    if (xhr.responseJSON.message) {
                        errorMessage = xhr.responseJSON.message;
                    } else if (xhr.responseJSON.errors) {
                        errorMessage = Object.values(xhr.responseJSON.errors)[0][0];
                    }
                }

                toastr.error(errorMessage);
            },
            complete: function() {
                // Reset button state
                submitBtn.html(originalBtnText).prop('disabled', false);
            }
        });
    });

    // Initialize charts if we're on the dashboard page
    if ($('#statusChart').length) {
        initDashboardCharts();
    }
});

function setStandardChartSize(canvasElement, width = 400, height = 300) {
    if (canvasElement) {
        canvasElement.width = width;
        canvasElement.height = height;
    }
}

function initDashboardCharts() {
    const chartData = $('#dashboard-charts-data').data('charts');

    if (!chartData) {
        console.warn('No chart data found');
        return;
    }

    // === 1. STATUS CHART ===
    const statusDataRaw = chartData.byStatus || {};
    const statusLabels = [];
    const statusCounts = [];

    Object.values(statusDataRaw).forEach(item => {
        statusLabels.push(item.name);
        statusCounts.push(item.count);
    });

    const statusCtx = document.getElementById('statusChart');
    setStandardChartSize(statusCtx);

    if (statusCtx) {
        new Chart(statusCtx, {
            type: 'bar',
            data: {
                labels: statusLabels,
                datasets: [{
                    label: 'Documents by Status',
                    data: statusCounts,
                    backgroundColor: 'rgba(66, 165, 245, 0.5)',
                    borderColor: 'rgba(66, 165, 245, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    // === 2. MONTHLY UPLOADS CHART ===
    const monthlyDataRaw = chartData.monthlyUploads || {};
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const monthlyCounts = monthlyLabels.map((_, i) => monthlyDataRaw[i + 1] || 0);

    const monthlyCtx = document.getElementById('monthlyUploadsChart');
    setStandardChartSize(monthlyCtx);

    if (monthlyCtx) {
        new Chart(monthlyCtx, {
            type: 'line',
            data: {
                labels: monthlyLabels,
                datasets: [{
                    label: 'Documents Uploaded',
                    data: monthlyCounts,
                    fill: true,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
            }
        });
    }

    // === 3. CATEGORY PIE CHART ===
    const categoryLabels = chartData.categoryLabels || [];
    const categoryData = chartData.categoryData || [];

    const categoryCtx = document.getElementById('categoryPieChart');
    setStandardChartSize(categoryCtx);

    if (categoryCtx) {
        new Chart(categoryCtx, {
            type: 'doughnut',
            data: {
                labels: categoryLabels,
                datasets: [{
                    data: categoryData,
                    backgroundColor: [
                        'rgba(66, 214, 151, 0.5)',
                        'rgba(251, 207, 51, 0.5)',
                        'rgba(251, 99, 64, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)'
                    ],
                    borderColor: [
                        'rgba(66, 214, 151, 1)',
                        'rgba(251, 207, 51, 1)',
                        'rgba(251, 99, 64, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    }
}


$(document).ready(function () {
    // Initialize Bootstrap tabs
    $('.nav-tabs a').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    // Handle tab changes
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
        // Store the currently active tab in local storage
        localStorage.setItem('activeDocumentTab', $(e.target).attr('href'));
    });

    // Restore active tab on page load
    let activeTab = localStorage.getItem('activeDocumentTab');
    if (activeTab) {
        $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
    }

    // Comment form submission
    $('#commentForm').on('submit', function (e) {
        e.preventDefault();
        let form = $(this);
        let submitBtn = form.find('button[type="submit"]');
        let commentText = form.find('textarea').val();

        if (!commentText.trim()) {
            return;
        }

        submitBtn.prop('disabled', true);

        $.ajax({
            url: form.attr('action'),
            type: 'POST',
            data: form.serialize(),
            success: function (response) {
                if (response.success) {
                    // Add new comment to the list
                    let newComment = `
                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0">
                                <div class="icon icon-shape bg-gradient-primary shadow icon-sm rounded-circle text-center d-flex align-items-center justify-content-center">
                                    <i class="fas fa-user text-white"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <div class="d-flex align-items-center mb-1">
                                    <h6 class="mb-0">${response.comment.user.name}</h6>
                                    <small class="text-muted ms-2">${response.comment.date}</small>
                                </div>
                                <p class="text-sm mb-0">${response.comment.content}</p>
                            </div>
                        </div>
                    `;
                    $('.comments-section').prepend(newComment);
                    form.find('textarea').val('');

                    // Show success message
                    showNotification('success', 'Comment added successfully');
                }
            },
            error: function (xhr) {
                showNotification('error', 'Failed to add comment. Please try again.');
            },
            complete: function () {
                submitBtn.prop('disabled', false);
            }
        });
    });

    // Document viewing
    $('.view-document').on('click', function (e) {
        e.preventDefault();
        let url = $(this).data('path');
        let title = $(this).data('title') || 'Document Viewer';
        console.log('URL:', url);
        $('#documentViewerModal').find('.modal-title').text(title);
        $('#documentViewerContent').html('<div class="text-center py-5"><i class="fas fa-spinner fa-spin fa-2x"></i></div>');

        // AJAX call to your controller
        $.ajax({
            url: '/client-portal/documents/view-document', // This should be the route to Client\DocumentController@viewDocument
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            dataType: 'json',
            data: {
                path: url
            },
            success: function (response) {
                if (response.success && response.streamUrl) {
                    const streamUrl = response.streamUrl;
                    const fileType = response.fileType.toLowerCase();
                    let viewerHtml = '';

                    if (fileType === 'pdf') {
                        viewerHtml = `<iframe src="${streamUrl}#toolbar=0" class="w-100" style="height: 80vh;" frameborder="0"></iframe>`;
                    } else if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(fileType)) {
                        viewerHtml = `<img src="${streamUrl}" class="img-fluid w-100" style="object-fit: contain; height: 80vh;" alt="Preview">`;
                    } else {
                        viewerHtml = `
                            <div class="text-center py-5">
                                <i class="fas fa-file fa-3x text-muted mb-3"></i>
                                <p class="mb-2">Preview not available for this file type.</p>
                                <a href="${streamUrl}" target="_blank" class="btn btn-primary" download>Download</a>
                            </div>`;
                    }

                    $('#documentViewerContent').html(viewerHtml);
                } else {
                    $('#documentViewerContent').html(`
                        <div class="text-center py-5 text-danger">
                            <i class="fas fa-exclamation-triangle fa-2x mb-3"></i>
                            <p>${response.message || 'Unable to load document.'}</p>
                        </div>`);
                }
            },
            error: function () {
                $('#documentViewerContent').html(`
                    <div class="text-center py-5 text-danger">
                        <i class="fas fa-exclamation-triangle fa-2x mb-3"></i>
                        <p>Unable to load document. Please try again later.</p>
                    </div>
                `);
            }
        });

        $('#documentViewerModal').modal('show');
    });
});
