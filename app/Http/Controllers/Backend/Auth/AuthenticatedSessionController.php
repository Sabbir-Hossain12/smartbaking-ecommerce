<?php

namespace App\Http\Controllers\Backend\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Admin;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        if(Auth::guard('admin')->check()){
            $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
            if($admin->hasrole('superadmin')){
                return redirect()->intended(RouteServiceProvider::ADMINHOME);
            }else if($admin->hasrole('admin')){
                return redirect('admin/dashboard');
            }else if($admin->hasrole('manager')){
                return redirect('order/manager/dashboard');
            }else if($admin->hasrole('user')){
                return redirect('order/dashboard');
            }else{
                abort(403);
            }
            abort(403);
        }else{
            return view('backend.auth.login');
        }
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {
        if(Auth::guard('admin')->attempt(['email'=>$request->email,'password'=>$request->password])){
            $admin=Admin::where('email',$request->email)->first();
            if($admin->hasrole('superadmin')){
                return redirect()->intended(RouteServiceProvider::ADMINHOME);
            }else if($admin->hasrole('admin')){
                return redirect('admin/dashboard');
            }else if($admin->hasrole('manager')){
                return redirect('order/manager/dashboard');
            }else if($admin->hasrole('user')){
                return redirect('order/dashboard');
            }else{
                abort(403);
            }
            abort(403);
        }else{
            return redirect()->back()->with('error','Information Does Not Match');
        }

    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Auth::guard('admin')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/admin/login');
    }

    public function dashboard(){
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        if($admin->hasrole('superadmin')){
            return view('backend.content.maincontent');
        }else{
            abort(403);
        }
    }

    public function managerdashboard(){
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        if($admin->hasrole(['superadmin','admin','manager'])){
            return view('admin.content.adminmaincontent');
        }else{
            abort(403);
        }
    }
    public function userdashboard(){
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        if($admin->hasrole(['superadmin','admin','manager','user'])){
            return view('admin.content.adminmaincontent');
        }else{
            abort(403);
        }
    }

}