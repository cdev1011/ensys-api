<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SignatoryTypes extends Model
{
    protected $table = 'signatory_position';
    protected $primaryKey = 'sig_pos_id';
    public $timestamps = false;
}
