<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserManagement extends Model
{
    protected $table = 'user_accounts';
    protected $primaryKey = 'uac_id';
    public $timestamps = false;
}
