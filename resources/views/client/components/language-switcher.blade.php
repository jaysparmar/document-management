<div class="nav-item dropdown">
    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <div class="d-flex align-items-center">
            <div class="icon icon-shape bg-gradient-info shadow icon-sm rounded-circle text-center me-2 d-flex align-items-center justify-content-center">
                <i class="fa fa-language text-white"></i>
            </div>
            <span class="d-none d-md-inline">{{ config('app.supported_languages')[app()->getLocale()] }}</span>
        </div>
    </a>
    <ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4">
        @foreach(config('app.supported_languages') as $locale => $language)
            <li>
                <a class="dropdown-item {{ app()->getLocale() == $locale ? 'active' : '' }}" 
                   href="{{ route('language.switch', ['locale' => $locale]) }}">
                    {{ $language }}
                </a>
            </li>
        @endforeach
    </ul>
</div>
