<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class UserRolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // create role
        $roleuser = Role::create(['name' => 'user','guard_name' => 'web']);

        //permission
        $permissions = [

            // dashboard permission
            [
                'group_name'=>'dashboard',
                'permissions'=>[
                    'dashboard.view',
                    'dashboard.edit',
                ]
            ],

            //profile permission
            [
                'group_name'=>'profile',
                'permissions'=>[
                    'profile.view',
                    'profile.edit',
                ]
            ],


        ];

        // create and assign permission
        for($i=0;$i<count($permissions);$i++){
            // permission group
            $permissionGroup = $permissions[$i]['group_name'];
            for($j=0;$j<count($permissions[$i]['permissions']);$j++){
                //create permission
                $permission = Permission::create(['name' => $permissions[$i]['permissions'][$j],'group_name'=>$permissionGroup,'guard_name' => 'web']);
                $roleuser->givePermissionTo($permission);
                $permission->assignRole($roleuser);
            }


        }
    }
}
