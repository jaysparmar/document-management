<?php

namespace App\Models;

use Ramsey\Uuid\Uuid;
use Illuminate\Database\Eloquent\Model;
use App\Models\UserRoles;
use App\Models\Meeting;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;
use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Builder;

class Users extends Authenticatable implements JWTSubject
{
    use HasFactory;
    use Notifiable, Uuids;
    protected $primaryKey = "id";
    public $timestamps = false;

    protected $fillable = [
        'firstName', 'lastName', 'userName', 'email', 'emailConfirmed', 'phoneNumberConfirmed', 'twoFactorEnabled',
        'lockoutEnabled', 'accessFailedCount', 'password', 'isDeleted','phoneNumber','resetPasswordCode'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function userRoles()
    {
        return $this->hasMany(UserRoles::class, 'userId', 'id');
    }

    public function userClaims()
    {
        return $this->hasMany(UserClaims::class, 'userId', 'id');
    }

    public function documentUserPermissions()
    {
        return $this->hasMany(DocumentUserPermissions::class, 'userId', 'id');
    }

    public function userNotifications()
    {
        return $this->hasMany(UserNotifications::class,'userId', 'id');
    }

    /**
     * Get meetings created by the user.
     */
    public function createdMeetings()
    {
        return $this->hasMany(Meeting::class, 'created_by', 'id');
    }

    /**
     * Get meetings the user is attending.
     */
    public function meetings()
    {
        return $this->belongsToMany(Meeting::class, 'meeting_user', 'user_id', 'meeting_id')
                    ->using(MeetingUser::class)
                    ->withPivot('is_accepted')
                    ->withTimestamps();
    }

    public function getJWTCustomClaims()
    {
        return [

            // 'picture'         => $this->getPicture(),
            // 'confirmed'       => $this->confirmed,
            // 'registered_at'   => $this->created_at->toIso8601String(),
            // 'last_updated_at' => $this->updated_at->toIso8601String(),
        ];
    }

    /**
     * Get the data for presence channel authorization.
     *
     * @return array
     */
    public function toPresenceData()
    {
        return [
            'id' => $this->id,
            'user_id' => $this->id,
            'name' => ($this->firstName ?? 'Unknown') . ' ' . ($this->lastName ?? 'User')
        ];
    }

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
