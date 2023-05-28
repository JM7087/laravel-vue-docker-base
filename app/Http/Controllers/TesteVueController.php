<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;

class TesteVueController extends Controller
{

    public function view()
    {
    
        $teste = 'olha mundo';

        // Log::debug("emtrou");

        return view('teste_Vue', ['teste' => $teste]);
    }

}