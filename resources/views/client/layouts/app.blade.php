<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="client-id" content="{{ $client->id ?? '' }}">

    <title>@yield('title', 'Client Portal') | Client Management</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="{{ asset('assets/angular/browser/assets/images/logo-small.png') }}">

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/nucleo-icons.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/nucleo-svg.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/toastr.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/custom.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/client/css/chat-popup.css') }}" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Main CSS -->
    <link href="{{ asset('assets/client/css/soft-ui-dashboard.css') }}" rel="stylesheet" />
    <!-- Add in head section -->
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css" rel="stylesheet">

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

        <!-- Chat Popup -->
        @include('client.partials.chat-popup')
    </main>

    <!-- Core JS Files -->
    <script src="{{ asset('assets/client/js/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/core/popper.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/core/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/plugins/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/plugins/smooth-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/plugins/chartjs.min.js') }}"></script>

    <!-- Excel Handling Libraries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>

    <!-- Custom JS -->
    <script src="{{ asset('assets/client/js/toastr.min.js') }}"></script>
    <script src="{{ asset('assets/client/js/custom.js') }}"></script>
    <script src="{{ asset('assets/client/js/chat-popup.js') }}"></script>

    <script>
        // Initialize tooltips
        document.addEventListener('DOMContentLoaded', function() {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });

            // Initialize language dropdown
            initLanguageDropdown();
        });

        // Function to initialize the language dropdown
        function initLanguageDropdown() {
            const languageItems = document.querySelectorAll('#language-dropdown .dropdown-item');

            languageItems.forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    const lang = this.getAttribute('data-language');
                    changeLanguage(lang);
                });
            });
        }

        // Function to change the language using Google Translate
        function changeLanguage(lang) {
            // Get the Google Translate select element
            const gtCombo = document.querySelector('.goog-te-combo');

            if (gtCombo) {
                // Set the value to the selected language
                gtCombo.value = lang;

                // Trigger the change event
                gtCombo.dispatchEvent(new Event('change'));

                // Highlight the selected language in the dropdown
                highlightSelectedLanguage(lang);
            } else {
                console.error('Google Translate element not found');
            }
        }
    </script>

    @stack('scripts')

    <!-- Google Translate Script -->
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                includedLanguages: 'ar,de,en,es,fr,it,ja,pt,ru,zh-CN', // Limit to languages in our dropdown
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
                autoDisplay: false,
                // Chat messages are excluded from translation using the notranslate class
                excludeIds: ['chatPopup']
            }, 'google_translate_element');

            // After Google Translate is initialized, set up the custom dropdown
            setTimeout(function() {
                // Check if the current language is set and update the dropdown
                const currentLang = document.querySelector('.goog-te-combo').value;
                if (currentLang) {
                    highlightSelectedLanguage(currentLang);
                }
            }, 1000);
        }

        // Function to highlight the selected language in the dropdown
        function highlightSelectedLanguage(lang) {
            // Remove active class from all items
            document.querySelectorAll('#language-dropdown .dropdown-item').forEach(item => {
                item.classList.remove('active');
            });

            // Add active class to the selected language
            const selectedItem = document.querySelector(`#language-dropdown .dropdown-item[data-language="${lang}"]`);
            if (selectedItem) {
                selectedItem.classList.add('active');
            }
        }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

    <!-- Custom CSS to fix Google Translate appearance -->
    <style>
        .goog-te-gadget {
            font-family: 'Open Sans', sans-serif !important;
            font-size: 0.875rem !important;
        }
        .goog-te-gadget-simple {
            background-color: transparent !important;
            border: none !important;
            padding: 0 !important;
            border-radius: 4px !important;
            display: flex !important;
            align-items: center !important;
            cursor: pointer !important;
        }
        .goog-te-menu-value {
            color: #67748e !important;
            font-weight: 500 !important;
            display: flex !important;
            align-items: center !important;
        }
        .goog-te-menu-value:hover {
            color: #252f40 !important;
            text-decoration: none !important;
        }
        .goog-te-menu-value span:first-child {
            margin-right: 4px !important;
        }
        .goog-te-menu-value span:not(:first-child) {
            display: none !important;
        }
        .goog-te-banner-frame {
            display: none !important;
        }
        body {
            top: 0 !important;
        }
        .goog-te-menu-frame {
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05) !important;
            border-radius: 8px !important;
        }

        /* Hide Google Translate top bar */
        .skiptranslate {
            display: none !important;
        }

        /* Hide Google Translate iframe */
        iframe.skiptranslate {
            display: none !important;
        }

        /* Custom language dropdown styles */
        #language-dropdown .dropdown-item.active {
            background-color: #e9ecef;
            color: #252f40;
            font-weight: 600;
        }
        #language-dropdown .dropdown-item.active::after {
            content: '✓';
            margin-left: 5px;
            color: #5e72e4;
        }
        #language-dropdown .dropdown-item {
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }
    </style>
</body>
</html>
