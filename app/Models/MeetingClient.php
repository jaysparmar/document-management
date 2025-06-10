<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\Pivot;
use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Builder;
use Ramsey\Uuid\Uuid;

class MeetingClient extends Pivot
{
    use HasFactory, Uuids;

    protected $table = 'meeting_clients';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = true;

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $fillable = [
        'meeting_id',
        'client_id',
        'is_accepted'
    ];

    protected $casts = [
        'is_accepted' => 'boolean',
    ];

    /**
     * Get the meeting that owns the pivot.
     */
    public function meeting()
    {
        return $this->belongsTo(Meeting::class, 'meeting_id', 'id');
    }

    /**
     * Get the client that owns the pivot.
     */
    public function client()
    {
        return $this->belongsTo(Clients::class, 'client_id', 'id');
    }

    /**
     * Boot function to add UUID generation
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function (Pivot $model) {
            $model->setAttribute($model->getKeyName(), Uuid::uuid4()->toString());
        });
    }
}
