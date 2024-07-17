<?php

namespace App\Exports;

use App\Models\Order;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class OrderdataExport implements FromQuery, WithHeadings,WithMapping
{




    use Exportable;
    private $orders_id;

    public function __construct($orders_id)
    {
        $this->orders_id = $orders_id;
    }


    public function map($order): array
    {
        return [
            $order->invoiceID,
            $order->customers->customerName,
            $order->customers->customerPhone,
            $order->customers->customerAddress,
            implode(', ', $order->orderproducts->pluck('productName')->toArray()),
            implode(', ', $order->orderproducts->pluck('productPrice')->toArray()),
            $order->comments->comment,
            $order->subTotal,
            $order->status,
            "",
            "",

        ];
    }

    public function query()
    {
        $ids=$this->orders_id;
        return Order::with(['orderproducts', 'customers', 'cities', 'zones'])->whereIn('id', $ids);


    }


    public function headings(): array
    {

        return ["Invoice", "Customer Name", "Contact No.", "Customer Address","Products","Price", "Instruction", "Product Selling Price","Status","Seller Name","Seller Phone"];

    }



}
