<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Builder;
use Ramsey\Uuid\Uuid;

class Meeting extends Model
{
    use HasFactory, Uuids;

    protected $primaryKey = "id";

    protected $fillable = [
        'title',
        'description',
        'start_time',
        'end_time',
        'jitsi_meeting_id',
        'created_by',
        'isDeleted'
    ];

    protected $casts = [
        'start_time' => 'datetime',
        'end_time' => 'datetime',
        'isDeleted' => 'boolean',
    ];

    /**
     * Get the user who created the meeting.
     */
    public function creator()
    {
        return $this->belongsTo(Users::class, 'created_by', 'id');
    }

    /**
     * Get the users attending the meeting.
     */
    public function users()
    {
        return $this->belongsToMany(Users::class, 'meeting_user', 'meeting_id', 'user_id')
                    ->using(MeetingUser::class)
                    ->withPivot('is_accepted')
                    ->withTimestamps();
    }

    /**
     * Get the clients attending the meeting.
     */
    public function clients()
    {
        return $this->belongsToMany(Clients::class, 'meeting_clients', 'meeting_id', 'client_id')
                    ->using(MeetingClient::class)
                    ->withPivot('is_accepted')
                    ->withTimestamps();
    }

    /**
     * Boot function to add global scope and UUID generation
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function (Model $model) {
            $model->setAttribute($model->getKeyName(), Uuid::uuid4());
        });

        static::addGlobalScope('isDeleted', function (Builder $builder) {
            $builder->where('isDeleted', '=', 0);
        });
    }
}
