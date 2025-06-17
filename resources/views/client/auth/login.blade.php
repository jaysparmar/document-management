@extends('client.layouts.auth')

@section('title', __('client.login'))

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">
                <div class="card-header text-center bg-gradient-primary">
                    <h4 class="text-white mb-0">{{ __('client.client_portal_login') }}</h4>
                </div>
                <div class="card-body">
                    <form method="POST" class="form-submit-event" action="{{ route('client-portal.authenticate') }}">
                        @csrf
                        <input type="hidden" name="redirect" value="{{ route('client-portal.home') }}">
                        <input type="hidden" name="reload" value="FALSE">
                        <div class="mb-3">
                            <label for="email" class="form-label">{{ __('client.email_address') }}</label>
                            <input type="email" name="email" class="form-control" id="email" required autofocus>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">{{ __('client.password') }}</label>
                            <input type="password" name="password" class="form-control" id="password" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" name="remember" class="form-check-input" id="remember">
                            <label class="form-check-label" for="remember">{{ __('client.remember_me') }}</label>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">{{ __('client.login') }}</button>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <small>
                        {{ __('client.forgot_password') }} <a href="{{ '#here' }}">{{ __('client.reset_here') }}</a>
                    </small>
                </div>
            </div>
            <!-- Language Switcher -->
            <div class="mt-3 text-center">
                @include('client.components.language-switcher')
            </div>
        </div>
    </div>
</div>
@endsection
