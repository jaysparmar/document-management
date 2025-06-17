@php
    use App\Helpers\ClientHelper;
    $client = ClientHelper::getAuthClient();
@endphp
<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur">
    <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
            <h6 class="font-weight-bolder mb-0">@yield('title', __('client.dashboard'))</h6>
        </nav>

        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
            <ul class="navbar-nav justify-content-end">
                <!-- Language Selector -->
                <li class="nav-item dropdown me-3">
                    @include('client.components.language-switcher')
                </li>

                <!-- Profile Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="d-flex align-items-center">
                            <div class="icon icon-shape bg-gradient-primary shadow icon-sm rounded-circle text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="fa fa-user text-white"></i>
                            </div>
                            <span class="d-none d-md-inline-block font-weight-bold">{{ $client->companyName }}</span>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4">
                        <li>
                            <div class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon icon-shape bg-gradient-primary shadow icon-sm rounded-circle text-center me-2">
                                        <i class="fa fa-user text-white"></i>
                                    </div>
                                    <div>
                                        <div class="text-sm mb-0">{{ $client->companyName }}</div>
                                        <div class="text-xs text-secondary mb-0">{{ $client->email }}</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="{{ route('client-portal.documents.index') }}">
                                <i class="fa fa-folder me-2"></i>
                                <span class="text-sm">{{ __('client.my_documents') }}</span>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="{{ route('client-portal.profile.index') }}">
                                <i class="fa fa-user me-2"></i>
                                <span class="text-sm">{{ __('client.profile_settings') }}</span>
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <form method="POST" action="{{ route('client-portal.logout') }}" id="logout-form">
                                @csrf
                                <a class="dropdown-item" href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    <i class="fa fa-power-off text-danger me-2"></i>
                                    <span class="text-sm">{{ __('client.logout') }}</span>
                                </a>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
