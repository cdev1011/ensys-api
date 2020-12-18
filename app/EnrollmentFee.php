<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EnrollmentFee extends Model
{
    protected $table = 'enrollment_fees';
    protected $primaryKey = 'enrollment_fee_id ';
    public $timestamps = false;
}
