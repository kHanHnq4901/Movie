<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    const VNP_TMN_CODE = "B6D7F86K";
    const VNP_HASH_SECRET = "YVVVDXXUGTGPFEVRUBWEXKIIYNNFUUTZ";
    const VNP_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

    protected $fillable = [
        'publisher_id',
        'product_id',
        'number_month',
        'discount',
        'transaction_code',
        'money',
        'vnp_response_code',
        'code_vnpay',
        'code_bank',
        'note',
        'time_payment',
        'method',
        'status',
        'created_at',
        'updated_at'
    ];

    protected $table = 'payments';

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }

    public function publisher()
    {
        return $this->hasOne(Publisher::class, 'id', 'publisher_id');
    }
}
