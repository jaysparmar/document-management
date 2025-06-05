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


