<?php

namespace App\Transformers;

use App\Curriculum;
use App\Semesters;
use App\Levels;
use App\Subjects;
use App\Courses;
use App\Prerequisites;
use League\Fractal\TransformerAbstract;

class CurriculumSubjectTransformer extends TransformerAbstract
{
    /**
     * List of resources to automatically include
     *
     * @var array
     */
    protected $defaultIncludes = [
        "prerequisites"
    ];
    
    /**
     * List of resources possible to include
     *
     * @var array
     */
    protected $availableIncludes = [
        //
    ];
    
    public function transform()
    {
        return [
            
        ];
    }
}
