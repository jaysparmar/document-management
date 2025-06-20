<?php

use App\Models\CompanyProfiles;

try {
    $appName = CompanyProfiles::first()->title;
} catch (\Exception $e) {
    $appName = config('app.name');
}

?>

<footer class="footer py-4">
    <div class="container-fluid">
        <div class="text-center">
            &copy; {{ date('Y') }} {{ $appName }}. {{ __('client.all_rights_reserved') }}
        </div>
    </div>
</footer>
