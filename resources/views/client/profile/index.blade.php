@extends('client.layouts.app')

@section('title', __('client.profile'))

@section('content')
<div class="container-fluid py-4">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header pb-0">
                    <div class="d-flex justify-content-between">
                        <h6>{{ __('client.profile_information') }}</h6>
                        <a href="{{ route('client-portal.profile.edit') }}" class="btn btn-primary btn-sm mb-0">
                            {{ __('client.edit_profile') }}
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">{{ __('client.company_name') }}</label>
                                <p class="form-control-static">{{ $client->companyName }}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">{{ __('client.contact_person') }}</label>
                                <p class="form-control-static">{{ $client->contactPerson }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">{{ __('client.email_address') }}</label>
                                <p class="form-control-static">{{ $client->email }}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">{{ __('client.phone_number') }}</label>
                                <p class="form-control-static">{{ $client->phoneNumber }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-control-label">{{ __('client.address') }}</label>
                                <p class="form-control-static">{{ $client->address }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
