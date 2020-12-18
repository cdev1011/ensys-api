<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rooms extends Model
{
    protected $table = 'room';
    protected $primaryKey = 'room_id';
    public $timestamps = false;
}
