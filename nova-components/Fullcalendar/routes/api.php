<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Tool API Routes
|--------------------------------------------------------------------------
|
| Here is where you may register API routes for your tool. These routes
| are loaded by the ServiceProvider of your tool. They are protected
| by your tool's "Authorize" middleware by default. Now, go build!
|
*/

// Route::get('/', function (Request $request) {
//     //
// });

Route::get('/nova-vendor/fullcalendar/users', function () {
    $data = User::all(); // Replace this with your data

    return response()->json($data);
});