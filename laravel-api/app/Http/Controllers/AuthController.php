<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Request;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        try {

            Request::validate([
                "name" => ['required', 'string'],
                "email" => ['required', 'email', 'unique:users'],
                "password" => ['required', 'min:6'],
            ]);

            $user = User::create([
                'name' => Request::input("name"),
                'email' => Request::input("email"),
                'password' => Hash::make(Request::input("password")),
            ]);

            $token = $user->createToken('auth')->plainTextToken;

            return response([
                'success' => true,
                'user' => $user,
                'token' => $token,
            ], 201);

        } catch (\Exception $e) {
            return response([
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function login(Request $request)
    {
        try {
            Request::validate([
                "email" => ['required', 'email'],
                "password" => ['required', 'min:6'],
            ]);

            $user = User::whereEmail(Request::input("email"))->first();
            if (!$user || !Hash::check(Request::input("password"), $user->password)) {
                return response([
                    'message' => 'Invalid Credentials',
                ], 422);
            }

            $token = $user->createToken('auth')->plainTextToken;

            return response([
                'success' => true,
                'user' => $user,
                'token' => $token,
            ], 200);

        } catch (\Exception $e) {
            return response([
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
