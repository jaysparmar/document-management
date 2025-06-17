<div class="dropdown">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
        {{ __('client.language') }}: {{ app()->getLocale() === 'en' ? __('client.english') : __('client.french') }}
    </button>
    <ul class="dropdown-menu" aria-labelledby="languageDropdown">
        <li>
            <a class="dropdown-item {{ app()->getLocale() === 'en' ? 'active' : '' }}" 
               href="{{ route('language.switch', ['locale' => 'en']) }}">
                {{ __('client.english') }}
            </a>
        </li>
        <li>
            <a class="dropdown-item {{ app()->getLocale() === 'fr' ? 'active' : '' }}" 
               href="{{ route('language.switch', ['locale' => 'fr']) }}">
                {{ __('client.french') }}
            </a>
        </li>
    </ul>
</div>
