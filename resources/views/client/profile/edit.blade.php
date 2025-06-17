@extends('client.layouts.app')

@section('title', __('client.edit_profile'))

@section('content')
<div class="container-fluid py-4">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header pb-0">
                    <h6>{{ __('client.edit_profile') }}</h6>
                </div>
                <div class="card-body">
                    <form action="{{ route('client-portal.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.company_name') }}</label>
                                    <input type="text" name="companyName" class="form-control @error('companyName') is-invalid @enderror"
                                           value="{{ old('companyName', $client->companyName) }}" required>
                                    @error('companyName')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.contact_person') }}</label>
                                    <input type="text" name="contactPerson" class="form-control @error('contactPerson') is-invalid @enderror"
                                           value="{{ old('contactPerson', $client->contactPerson) }}" required>
                                    @error('contactPerson')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.email_address') }}</label>
                                    <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                                           value="{{ old('email', $client->email) }}" required>
                                    @error('email')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.phone_number') }}</label>
                                    <input type="text" name="phoneNumber" class="form-control @error('phoneNumber') is-invalid @enderror"
                                           value="{{ old('phoneNumber', $client->phoneNumber) }}" required>
                                    @error('phoneNumber')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.address') }}</label>
                                    <textarea name="address" class="form-control @error('address') is-invalid @enderror"
                                              rows="3" required>{{ old('address', $client->address) }}</textarea>
                                    @error('address')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <hr class="horizontal dark">
                        <p class="text-uppercase text-sm">{{ __('client.change_password') }}</p>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.current_password') }}</label>
                                    <input type="password" name="current_password" class="form-control @error('current_password') is-invalid @enderror">
                                    @error('current_password')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.new_password') }}</label>
                                    <input type="password" name="new_password" class="form-control @error('new_password') is-invalid @enderror">
                                    @error('new_password')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-control-label">{{ __('client.confirm_password') }}</label>
                                    <input type="password" name="new_password_confirmation" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end mt-4">
                            <a href="{{ route('client-portal.profile.index') }}" class="btn btn-light me-2">{{ __('client.cancel') }}</a>
                            <button type="submit" class="btn btn-primary">{{ __('client.save_changes') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
