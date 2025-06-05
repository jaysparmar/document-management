<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield('title', 'Client Portal')</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="{{ asset('assets/client/img/favicon.png') }}">

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/nucleo-icons.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/nucleo-svg.css') }}" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

    <!-- Main CSS -->
    <link href="{{ asset('assets/client/css/soft-ui-dashboard.css?v=1.0.3') }}" rel="stylesheet" />

    @stack('styles')
</head>
<body class="g-sidenav-show bg-gray-100">

    @include('client.partials.sidebar')

    <main class="main-content position-relative border-radius-lg">
        @include('client.partials.navbar')

        <div class="container-fluid py-4">
            @yield('content')
        </div>

        @include('client.partials.footer')
    </main>

    <!-- Core JS Files -->
    <script src="{{ asset('assets/client/js/core/popper.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/core/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/plugins/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/plugins/smooth-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/soft-ui-dashboard.min.js?v=1.0.3') }}"></script>

    @stack('scripts')
</body>
</html>
