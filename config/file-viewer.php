<?php

return [
    'route_prefix' => 'file-viewer',

    'middleware' => ['web', 'auth:client'],

    'downloads_route' => true,

    'preview_blade_view' => 'client.documents.viewer',

    'supported_formats' => [
        'pdf',
        'doc', 'docx',
        'xls', 'xlsx',
        'ppt', 'pptx',
        'txt',
        'jpg', 'jpeg', 'png', 'gif', 'bmp',
    ],

    'google_viewer_formats' => [
        'doc', 'docx',
        'xls', 'xlsx',
        'ppt', 'pptx',
    ],

    'stream_formats' => [
        'pdf',
        'jpg', 'jpeg', 'png', 'gif', 'bmp',
    ],
];
