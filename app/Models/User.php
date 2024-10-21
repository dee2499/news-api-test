<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;


/**
 * @OA\Schema(
 *     schema="User",
 *     type="object",
 *     @OA\Property(property="id", type="integer", description="The unique identifier of the user"),
 *     @OA\Property(property="name", type="string", description="The name of the user"),
 *     @OA\Property(property="email", type="string", format="email", description="The email address of the user"),
 *     @OA\Property(property="password", type="string", description="The password of the user"),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="The date and time the user was created"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="The date and time the user was last updated"),
 *     @OA\Property(property="email_verified_at", type="string", format="date-time", description="The date and time the email was verified")
 * )
 */

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function preferences()
    {
        return $this->hasOne(Preference::class);
    }

}
