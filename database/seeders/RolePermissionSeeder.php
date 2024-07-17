<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // create role
        $rolesuperadmin = Role::create(['name' => 'superadmin','guard_name' => 'admin']);
        $roleadmin = Role::create(['name' => 'admin','guard_name' => 'admin']);
        $rolemanager = Role::create(['name' => 'manager','guard_name' => 'admin']);
        $roleuser = Role::create(['name' => 'user','guard_name' => 'admin']);

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
            // admin permission
            [
                'group_name'=>'admin',
                'permissions'=>[
                    'admin.create',
                    'admin.view',
                    'admin.edit',
                    'admin.delete',
                    'admin.approved',
                ]
            ],


            // role permission
            [
                'group_name'=>'role',
                'permissions'=>[
                    'role.create',
                    'role.view',
                    'role.edit',
                    'role.delete',
                    'role.approved',
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

            // category permission
            [
                'group_name'=>'category',
                'permissions'=>[
                    'category.create',
                    'category.view',
                    'category.edit',
                    'category.delete',
                    'category.approved',
                ]
            ],

        ];

        // create and assign permission
        for($i=0;$i<count($permissions);$i++){
            // permission group
            $permissionGroup = $permissions[$i]['group_name'];
            for($j=0;$j<count($permissions[$i]['permissions']);$j++){
                //create permission
                $permission = Permission::create(['name' => $permissions[$i]['permissions'][$j],'group_name'=>$permissionGroup,'guard_name' => 'admin']);
                $rolesuperadmin->givePermissionTo($permission);
                $permission->assignRole($rolesuperadmin);
            }


        }
    }
}
