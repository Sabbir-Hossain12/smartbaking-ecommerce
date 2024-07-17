<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Information;
use Illuminate\Support\Facades\Hash;

class InformationSeeder extends Seeder
{
    protected $informations = [
        [
            'key'                       =>  'about_us',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'contact_us',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'shipping_guide',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'investor_relation',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'company',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'customer_service',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'help_center',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'faq',
            'value'                     =>  '....',
        ],
        [
            'key'                       =>  'terms_codition',
            'value'                     =>  '....',
        ],
    ];

    public function run()
    {
        foreach ($this->informations as $index => $information) {
            $result = Information::create($information);
            if(!$result) {
                $this->command->info("Insert failed at record $index.");
                return;
            }
        }
        $this->command->info('Inserted ' . count($this->informations) . ' records');
    }
}