@php
    use App\Helpers\ClientHelper;
@endphp
<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur">
    <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
            <h6 class="font-weight-bolder mb-0">@yield('title', 'Dashboard')</h6>
        </nav>

        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
            <ul class="navbar-nav justify-content-end">
                <li class="nav-item dropdown pe-3">
                    <a class="nav-link d-flex align-items-center cursor-pointer" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="d-flex align-items-center">
                            <img src="{{ asset('assets/client/img/avatar.png') }}" class="avatar avatar-sm me-2" alt="avatar">
                            <span class="d-none d-md-inline-block">{{ ClientHelper::getAuthClient()->companyName }}</span>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4" aria-labelledby="profileDropdown">
                        <li class="mb-2">
                            <a class="dropdown-item border-radius-md" href="{{ '#client-profile' }}">
                                <div class="d-flex align-items-center py-1">
                                    <i class="ni ni-single-02 text-sm me-2"></i>
                                    <span class="text-sm">{{ __('Profile') }}</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item border-radius-md" href="{{ '#client-portal.logout' }}">
                                <div class="d-flex align-items-center py-1">
                                    <i class="ni ni-button-power text-sm me-2"></i>
                                    <span class="text-sm">{{ __('Logout') }}</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
