<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class BasicinfoFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'phone_one' =>'+8801928558628',
            'phone_two' =>'+8801647368141',
            'email' =>'support@ayebazar.com',
            'address' => 'House:22,Road:4,Block:D,Estern Housing,Mirpur:11.5',
            'logo' => 'public/webview/assets/images/logo.png',
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function unverified()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }
}
