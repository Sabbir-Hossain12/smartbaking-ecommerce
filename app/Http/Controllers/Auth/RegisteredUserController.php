<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $olduseremail =User::where('email',$request->email)->first();
        if(isset($olduseremail)){
            return redirect()->back()->with('error','Email already exist !');
        }else{
            $oldphone =User::where('phone',$request->phone)->first();
            if(isset($oldphone)){
                return redirect()->back()->with('error','Phone number already exist !');
            }else{
                $user = new User();
                $user->name=$request->name;
                $user->email=$request->email;
                $user->phone=$request->phone;
                $otp = random_int(100000, 999999);
                $user->otp = $otp;
                $otppass=$otp;
                $user->active_status = 0;
                $user-> password=Hash::make($request-> password);
                $success=$user->save();
            }
        }

        event(new Registered($user));

        Auth::login($user);

        return redirect(RouteServiceProvider::HOME);
    }
}
