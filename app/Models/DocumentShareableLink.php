<?php

namespace App\Models;

use Ramsey\Uuid\Uuid;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use App\Traits\Uuids;

class DocumentShareableLink extends Model
{
    use HasFactory, SoftDeletes;
    use Notifiable, Uuids;
    protected $primaryKey = "id";
    protected  $table = 'documentShareableLink';
    public $incrementing = false;

    const CREATED_AT = 'createdDate';
    const UPDATED_AT = 'modifiedDate';

    protected $fillable = [
        'documentId',
        'linkExpiryTime',
        'password',
        'linkCode',
        'isAllowDownload',
        'createdBy',
        'createdDate',
        'modifiedBy',
        'isDeleted'
    ];

    protected $casts = [
        'linkExpiryTime' => 'datetime'
    ];

    public function document()
    {
        return $this->belongsTo(Documents::class, 'documentId');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function (Model $model) {
            $userId = Auth::parseToken()->getPayload()->get('userId');
            $model->createdBy = $userId;
            $model->modifiedBy = $userId;
            $model->setAttribute($model->getKeyName(), Uuid::uuid4());
        });
        static::updating(function (Model $model) {
            $userId = Auth::parseToken()->getPayload()->get('userId');
            $model->modifiedBy = $userId;
        });
    }
}
