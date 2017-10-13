<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_UserProfile.ascx.cs" Inherits="Effigy.Web.UserControl.UC_UserProfile" %>
<style>
    video {
        display: block;
        width: 350px;
        height: 280px;
        margin: 0 0 20px 0;
    }

    #canvas {
        margin-top: 20px;
        width: 380px;
        height: 280px;
        display: none;
    }
</style>
<div class="navbar navbar-default navbar-component navbar-xs">
    <ul class="nav navbar-nav visible-xs-block">
        <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
    </ul>
    <div class="navbar-collapse collapse" id="navbar-filter">
        <ul class="nav navbar-nav">
            <li class=""><a href="#activity" data-toggle="tab" aria-expanded="false"><i class="icon-user position-left"></i>Personal Information</a></li>
            <li class=""><a href="#schedule" data-toggle="tab" aria-expanded="false"><i class="icon-calendar3 position-left"></i>Contact Detail</a></li>
            <li class="active"><a href="#settings" data-toggle="tab" aria-expanded="true"><i class="icon-cog3 position-left"></i>Bank Detail</a></li>
        </ul>
    </div>
</div>
<!-- Content area -->
<div class="content">
    <!-- User profile -->
    <div class="row">
        <div class="col-lg-9">
            <div class="tabbable">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="activity">
                        <!-- Profile info -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title">Personal information</h6>
                                <div class="heading-elements">
                                </div>
                            </div>
                            <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>First Name</label>
                                                <input type="text" id="txtFirstName" value="Eugene" class="form-control" />
                                            </div>
                                            <div class="col-md-6">
                                                <label>Last Name</label>
                                                <input type="text" id="txtLastName" value="Kopyov" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button type="button" class="btn btn-primary" >Next <i class="icon-arrow-right14 position-right"></i></button>
                                    </div>
                            </div>
                        </div>
                        <!-- /profile info -->
                    </div>
                    <div class="tab-pane fade" id="schedule">
                        <!-- Profile info -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title">Contact Detail</h6>
                                <div class="heading-elements">
                                </div>
                            </div>

                            <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Address line 1</label>
                                                <input type="text" id="txtAddressLine1" class="form-control">
                                            </div>
                                            <div class="col-md-6">
                                                <label>Address line 2</label>
                                                <input type="text" id="txtAddressLine2" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>Your country</label>
                                                <select class="form-control" id="ddlCountry">
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <label>State/Province</label>
                                                <select id="ddlState" class="form-control"></select>
                                            </div>
                                            <div class="col-md-4">
                                                <label>City</label>
                                                <select id="ddlCity" class="form-control"></select>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                    <input type="text" id="txtEmail" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>ZIP code</label>
                                                    <input type="text" id="txtZipCode" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone #</label>
                                                <input type="text" id="txtPhone" class="form-control">
                                                <span class="help-block">+99-99-9999-9999</span>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="display-block">Upload profile image</label>
                                                <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                                                <div class="uploader" style="width:150px;float:left;margin-right:2px">
                                                    <input type="file" class="file-styled-primary" onchange="UploadImage(this);" id="filePhoto"><span class="action btn bg-blue" id="fileSpan">Choose File</span>
                                                </div>
                                                <div style="float:left">
                                                <button type="button" class="btn btn-primary" id="btnTakePhoto" onclick="TakePicture()">From Camera</button></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button type="button" class="btn btn-primary" >Next <i class="icon-arrow-right14 position-right"></i></button>
                                    </div>
                            </div>
                        </div>
                        <!-- /profile info -->
                    </div>
                    <div class="tab-pane fade" id="settings">
                        <!-- Profile info -->
                        <div class="panel panel-flat">
                            <div class="panel-heading">
                                <h6 class="panel-title">Bank Detail information</h6>
                                <div class="heading-elements">
                                </div>
                            </div>

                                <div class="panel-body">
                                    <form action="#">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Account Holder</label>
                                                    <input type="text" id="txtACHolderName" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Account Number</label>
                                                    <input type="text" id="txtAccountNo" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Bank</label>
                                                    <select id="ddlBank" class="form-control"></select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Branch Name</label>
                                                    <input type="text" id="txtBranchName" value="Kopyov" class="form-control">
                                                </div>
                                            </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                    <label>IFSC Code</label>
                                                    <input type="text" id="txtIFSCCode" value="Kopyov" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>BranchAddress</label>
                                                    <input type="text" id="txtBranchAddress" value="Kopyov" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <button type="button" id="btnSave" class="btn btn-primary">Save <i class="icon-arrow-right14 position-right"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /profile info -->
                        </div>
                    </div>
                </div>
            </div>

        <div class="col-lg-3">

            <!-- User thumbnail -->
            <div class="thumbnail">
                <div class="thumb thumb-rounded thumb-slide">
                    <img id="imgUserPhoto" src="" alt="">
                    <div class="caption">
                    </div>
                </div>

                <div class="caption text-center">
                    <h6 class="text-semibold no-margin" id="hUserName"><small class="display-block"></small></h6>
                    <ul class="icons-list mt-15">
                        <li><a href="#" data-popup="tooltip" title="Google Drive"><i class="icon-google-drive"></i></a></li>
                        <li><a href="#" data-popup="tooltip" title="Twitter"><i class="icon-twitter"></i></a></li>
                        <li><a href="#" data-popup="tooltip" title="Github"><i class="icon-github"></i></a></li>
                    </ul>
                </div>
            </div>
            <!-- /user thumbnail -->

        </div>
    </div>
    <!-- /user profile -->
</div>


<div id="modal_form_vertical" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h5 class="modal-title" id="headingTitle">Take picture</h5>
            </div>
            <div class="modal-body">
                <video id="video" width="680" height="480" autoplay></video>
                <canvas id="canvas" width="680" height="480"></canvas>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="snap">Take Photo</button>
                <button type="button" class="btn btn-primary" id="retake">Reset</button>

            </div>
        </div>
    </div>
</div>
