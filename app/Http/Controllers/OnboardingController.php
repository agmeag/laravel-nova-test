<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class OnboardingController extends Controller
{
    public function index()
    {
        // Replace this with your logic to fetch the onboarding texts from your source.
        $texts = [
            'step1' => 'First step onboarding text',
            'step2' => 'Second step onboarding text',
            'step3' => 'Third step onboarding text',
        ];

        return response()->json($texts);
    }
}