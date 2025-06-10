<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Ramsey\Uuid\Uuid;

class Clients extends Authenticatable
{
    use HasFactory, SoftDeletes;
    use Notifiable, Uuids;

    protected $primaryKey = "id";
    public $table = 'clients';
    const CREATED_AT = 'createdDate';
    const UPDATED_AT = 'modifiedDate';

    protected $hidden = ['password', 'createdBy', 'modifiedBy', 'deletedBy', 'createdDate', 'modifiedDate', 'isDeleted', 'deleted_at'];

    protected $fillable = [
        'id', 'companyName', 'contactPerson', 'email', 'password', 'phoneNumber', 'address',
    ];

    /**
     * Set the password attribute.
     *
     * @param string $value
     * @return void
     */
    public function setPasswordAttribute($value)
    {
        if (!empty($value)) {
            $this->attributes['password'] = Hash::make($value);
        }
    }

    public function documents()
    {
        return $this->hasMany(Documents::class, 'client_id');
    }

    public function pendingDocuments()
    {
        return $this->documents()->where('status', 'pending');
    }

    public function approvedDocuments()
    {
        return $this->documents()->where('status', 'approved');
    }

    /**
     * Get the meetings that the client is attending.
     */
    public function meetings()
    {
        return $this->belongsToMany(Meeting::class, 'meeting_clients', 'client_id', 'meeting_id')
                    ->using(MeetingClient::class)
                    ->withPivot('is_accepted')
                    ->withTimestamps('created_at', 'updated_at');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ( $model) {
            $userId = Auth::parseToken()->getPayload()->get('userId');
            $model->createdBy = $userId;
            $model->modifiedBy = $userId;
            $model->setAttribute($model->getKeyName(), Uuid::uuid4());
        });

        static::updating(function ( $model) {
            $userId = Auth::parseToken()->getPayload()->get('userId');
            $model->modifiedBy = $userId;
        });

        static::addGlobalScope('isDeleted', function (Builder $builder) {
            $builder->where('clients.isDeleted', '=', 0);
        });
    }
}
