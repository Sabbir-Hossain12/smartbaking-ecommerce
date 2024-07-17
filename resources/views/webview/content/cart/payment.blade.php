@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-Complete
@endsection
     <br>
    <div class="container pb-5 mb-sm-4 mt-4 mb-4">
        <div class="pt-5 pb-5" style="margin-bottom:5px">
            <div class="card py-3 mt-sm-3">
                <div class="card-body text-center">
                    <h2 class="h4 pb-3" style="color:green">আপনার অর্ডারটি সফলভাবে সম্পন্ন হয়েছে আমাদের কল সেন্টার থেকে ফোন করে আপনার অর্ডারটি কনফার্ম করা হবে</h2>
                    <a class="btn btn-primary mt-3" href="{{url('/')}}">প্রোডাক্ট বাছাই করুন</a>
                </div>
            </div>
        </div>
    </div>
@endsection
