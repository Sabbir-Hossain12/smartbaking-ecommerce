@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-{{ $title }}
@endsection

<div class="body-content outer-top-xs">
    <div class="breadcrumb pt-2">
        <div class="container">
            <div class="row">
                <div class="breadcrumb-inner p-0">
                    <ul class="list-inline list-unstyled mb-0">
                        <li><a href="#"
                                style="text-transform: capitalize !important;color: #888;padding-right: 12px;font-size: 12px;">Home
                                > {{ $title }}
                            </a></li>
                    </ul>
                </div>
                <!-- /.breadcrumb-inner -->
            </div>
        </div>
        <!-- /.container -->
    </div>
</div>

<div class="container">
    <div class="row mt-4">
        <div class="col-12 p-0">
            <div class="body-content outer-top-xs p-2" style="background: white !important;">
                @if (request()->segment(count(request()->segments())) == 'contact_us')
                    @php
                        $basicinfo = App\Models\Basicinfo::first();
                    @endphp

                    <div class="body-content">
                        <div class="container">
                            <div class="contact-page">
                                <div class="row">
                                    <div class="col-12 contact-map outer-bottom-vs"><iframe height="450"
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3886.0080692193424!2d80.29172299999996!3d13.098675000000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a526f446a1c3187%3A0x298011b0b0d14d47!2sTransvelo!5e0!3m2!1sen!2sin!4v1412844527190"
                                            style="border:0" width="100%"></iframe></div>

                                    <div class="col-md-9 contact-form">
                                        <div class="col-md-12 contact-title">
                                            <h4>Contact Form</h4>
                                        </div>

                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-4">

                                                    <div class="form-group">Your Name * <input type="email" /></div>

                                                </div>

                                                <div class="col-md-4">

                                                    <div class="form-group">Email Address * <input type="email" />
                                                    </div>

                                                </div>

                                                <div class="col-md-4">

                                                    <div class="form-group">Title * <input type="email" /></div>

                                                </div>

                                                <div class="col-md-12">

                                                    <div class="form-group">Your Comments *
                                                        <textarea></textarea>
                                                    </div>

                                                </div>
                                                <div class="col-12">
                                                    <div
                                                        class="col-md-12 m-t-20 outer-bottom-small btn btn-danger btn-block">
                                                        Send Message</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-md-3 contact-info">
                                        <div class="contact-title">
                                            <h4>Information</h4>
                                        </div>

                                        <div class="address clearfix">{{ $basicinfo->address }}
                                        </div>
                                        <br>

                                        <div class="clearfix phone-no">+(88) {{ $basicinfo->phone_one }}<br> +(88)
                                            {{ $basicinfo->phone_two }}</div>

                                        <div class="clearfix email"><a
                                                href="mailto:{{ $basicinfo->email }}">{{ $basicinfo->email }}</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.contact-page -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                @else
                    {!! $value->value !!}
                @endif
            </div>
        </div>
    </div>
</div>
</div>

<style>
    .breadcrumb {
        padding: 5px 0;
        border-bottom: 1px solid #e9e9e9;
        background-color: #fafafa;
    }
</style>
@endsection
