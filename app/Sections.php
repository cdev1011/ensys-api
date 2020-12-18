<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sections extends Model
{
    protected $table = 'sections';
    protected $primaryKey = 'section_id';
    public $timestamps = false;
}
