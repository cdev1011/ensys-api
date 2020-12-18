<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Signatories extends Model
{
    protected $table = 'signatories';
    protected $primaryKey = 'signatory_id';
    public $timestamps = false;
}
