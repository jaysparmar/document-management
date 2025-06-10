<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChMessage extends Model
{
    protected $table = 'ch_messages'; // Adjust if your table name is different

    protected $fillable = [
        'id',
        'from_id',
        'to_id',
        'body',
        'attachment',
        'attachment_url',
        'created_at',
        'from_type',
        'to_type',
        'read_at',
    ];

    public $incrementing = false; // Because you're using UUIDs
    protected $keyType = 'string';
}
