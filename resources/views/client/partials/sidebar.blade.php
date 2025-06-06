<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 bg-white" id="sidenav-main">
    <div class="sidenav-header">
        <a class="navbar-brand bg-dark m-0" href="{{ route('client-portal.home') }}">
            <img src="{{ asset('assets/angular/browser/assets/images/logo.png') }}" class="navbar-brand-img h-100" alt="main_logo">

        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            {{-- Dashboard --}}
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center {{ Request::is('client-portal') ? 'active' : '' }}"
                   href="{{ route('client-portal.home') }}">
                    <div class="icon-wrapper me-2 {{ Request::is('client-portal') ? 'active-icon' : '' }}">
                        <i class="fas fa-th-large"></i>
                    </div>
                    <span class="nav-link-text">Dashboard</span>
                </a>
            </li>

            {{-- My Documents --}}
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center {{ Request::is('client-portal/documents*') ? 'active' : '' }}"
                   href="{{ route('client-portal.documents.index') }}">
                    <div class="icon-wrapper me-2 {{ Request::is('client-portal/documents*') ? 'active-icon' : '' }}">
                        <i class="fas fa-file-alt"></i>
                    </div>
                    <span class="nav-link-text">My Documents</span>
                </a>
            </li>

            {{-- Upload Document
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center {{ Request::is('client-portal/documents/create') ? 'active' : '' }}"
                   href="{{ route('client-portal.documents.create') }}">
                    <div class="icon-wrapper me-2 {{ Request::is('client-portal/documents/create') ? 'active-icon' : '' }}">
                        <i class="fas fa-cloud-upload-alt"></i>
                    </div>
                    <span class="nav-link-text">Upload Document</span>
                </a>
            </li> --}}

            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account</h6>
            </li>

            {{-- Profile Settings --}}
            <li class="nav-item">
                <a class="nav-link d-flex align-items-center {{ Request::is('client-portal/profile*') ? 'active' : '' }}"
                   href="{{ route('client-portal.profile.index') }}">
                    <div class="icon-wrapper me-2 {{ Request::is('client-portal/profile*') ? 'active-icon' : '' }}">
                        <i class="fas fa-user"></i>
                    </div>
                    <span class="nav-link-text">Profile Settings</span>
                </a>
            </li>
        </ul>
    </div>
</aside>

