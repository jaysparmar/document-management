<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\Pivot;
use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Builder;
use Ramsey\Uuid\Uuid;

class MeetingUser extends Pivot
{
    use HasFactory, Uuids;

    protected $table = 'meeting_user';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = true;

    protected $fillable = [
        'meeting_id',
        'user_id',
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
     * Get the user that owns the pivot.
     */
    public function user()
    {
        return $this->belongsTo(Users::class, 'user_id', 'id');
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
