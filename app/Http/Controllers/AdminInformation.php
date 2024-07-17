<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminInformation extends Controller
{
    public function dashboard(){
        return view('admin.content.adminmaincontent');
    }
    public function myprofile()
    {
        $admin = Admin::where('id', Auth::guard('admin')->user()->id)->first();
        return view('admin.settings.myprofile', ['admin' => $admin]);
    }

    public function settings()
    {
        $admin = Admin::where('id', Auth::guard('admin')->user()->id)->first();
        return view('admin.settings.accountsettings', ['admin' => $admin]);
    }

    public function profileupdate(Request $request)
    {
        $admin = Admin::where('id', $request->admin_id)->first();

        $oldimage = $admin->profile;
        $profileImg = $request->file('profile');

        if ($oldimage) {
            unlink($admin->profile);
            $name = time() . "_" . $profileImg->getClientOriginalName();
            $uploadPath = ('public/images/admin/profile/');
            $profileImg->move($uploadPath, $name);
            $imageUrl = $uploadPath . $name;
            $admin->profile = $imageUrl;
        } else {
            $name = time() . "_" . $profileImg->getClientOriginalName();
            $uploadPath = ('public/images/admin/profile/');
            $profileImg->move($uploadPath, $name);
            $imageUrl = $uploadPath . $name;
            $admin->profile = $imageUrl;
        }
        $admin->save();
        return redirect()->back()->with('success', 'Profile Update Successfully');
    }

    public function adminupdate(Request $request)
    {

        if ($request->old_email) {
            $adminemail = Admin::where('email', $request->old_email)->first();

            if ($adminemail) {
                $adminemail->email = $request->email;
                $adminemail->save();
                return redirect()->back()->with('success', 'Email Update Successfully');
            } else {
                return redirect()->back()->with('error', 'Old Email Not Valid');
            }
        }  else {
            $adminpass = Admin::where('email', $request->main_email)->first();

            if ($adminpass) {
                $adminpass->password = Hash::make($request->password);
                $adminpass->save();
                return redirect()->back()->with('success', 'Password Update Successfully');
            }
        }

    }
}
