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

class OrderExport implements FromQuery, WithHeadings,WithMapping
{



//->whereBetween('last_updated', ['2023-04-23','2023-05-2'])->where('status', 'Delivered');
    use Exportable;
    private $curierid;

    public function __construct($curierid)
    {
        $this->curierid = $curierid;
    }


    public function map($order): array
    {
        if($this->curierid ==10){
            return [
                $order->invoiceID,
                $order->customers->customerName,
                $order->customers->customerPhone,
                $order->customers->customerAddress,
                $order->cities->cityName,
                $order->zones->zoneName,
                $order->zones->zoneId,
                $order->cities->division,
                $order->subTotal,
                $order->subTotal,
                "500",
                implode(', ', $order->orderproducts->pluck('productName')->toArray()),
                "",
                "",

            ];
        }else{
            return [
                $order->invoiceID,
                $order->customers->customerName,
                $order->customers->customerAddress,
                $order->customers->customerPhone,
                $order->subTotal,
                implode(', ', $order->orderproducts->pluck('productName')->toArray()),
                '',
                '',

            ];
        }
    }

    public function query()
    {
        $id=$this->curierid;
        return Order::with(['orderproducts', 'customers', 'cities', 'zones'])->where('courier_id', $id)->where('status', 'Checked Invoiced');

    }


    public function headings(): array
    {
        if($this->curierid == 10){
            return ["Invoice", "Customer Name", "Contact No.", "Customer Address", "District", "Area", "Area ID", "Division", "Price", "Product Selling Price",'Weight(g)', "Instruction","Seller Name","Seller Phone"];
        }else{
            return ["Invoice", "Name", "Address", "Phone", "Amount", "Note", "Contact Name", "Contact Phone"];
        }
    }



}
