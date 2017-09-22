<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Effigy.Web.UserProfile.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="navbar navbar-default navbar-component navbar-xs">
        <ul class="nav navbar-nav visible-xs-block">
            <li class="full-width text-center"><a data-toggle="collapse" data-target="#navbar-filter"><i class="icon-menu7"></i></a></li>
        </ul>

        <div class="navbar-collapse collapse" id="navbar-filter">
            <ul class="nav navbar-nav">
                <li class=""><a href="#activity" data-toggle="tab" aria-expanded="false"><i class="icon-user position-left"></i>Personal Information</a></li>
                <li class=""><a href="#schedule" data-toggle="tab" aria-expanded="false"><i class="icon-calendar3 position-left"></i>Contact Detail <span class="badge badge-success badge-inline position-right">32</span></a></li>
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
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                            <li><a data-action="close"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <form action="#">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Username</label>
                                                    <input type="text" value="Eugene" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Full name</label>
                                                    <input type="text" value="Kopyov" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Address line 1</label>
                                                    <input type="text" value="Ring street 12" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Address line 2</label>
                                                    <input type="text" value="building D, flat #67" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>City</label>
                                                    <input type="text" value="Munich" class="form-control">
                                                </div>
                                                <div class="col-md-4">
                                                    <label>State/Province</label>
                                                    <input type="text" value="Bayern" class="form-control">
                                                </div>
                                                <div class="col-md-4">
                                                    <label>ZIP code</label>
                                                    <input type="text" value="1031" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                    <input type="text" readonly="readonly" value="eugene@kopyov.com" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Your country</label>
                                                    <select class="select">
                                                        <option value="germany" selected="selected">Germany</option>
                                                        <option value="france">France</option>
                                                        <option value="spain">Spain</option>
                                                        <option value="netherlands">Netherlands</option>
                                                        <option value="other">...</option>
                                                        <option value="uk">United Kingdom</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Phone #</label>
                                                    <input type="text" value="+99-99-9999-9999" class="form-control">
                                                    <span class="help-block">+99-99-9999-9999</span>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="display-block">Upload profile image</label>
                                                    <input type="file" class="file-styled">
                                                    <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Save <i class="icon-arrow-right14 position-right"></i></button>
                                        </div>
                                    </form>
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
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                            <li><a data-action="close"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <form action="#">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Username</label>
                                                    <input type="text" value="Eugene" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Full name</label>
                                                    <input type="text" value="Kopyov" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Address line 1</label>
                                                    <input type="text" value="Ring street 12" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Address line 2</label>
                                                    <input type="text" value="building D, flat #67" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>City</label>
                                                    <input type="text" value="Munich" class="form-control">
                                                </div>
                                                <div class="col-md-4">
                                                    <label>State/Province</label>
                                                    <input type="text" value="Bayern" class="form-control">
                                                </div>
                                                <div class="col-md-4">
                                                    <label>ZIP code</label>
                                                    <input type="text" value="1031" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                    <input type="text" readonly="readonly" value="eugene@kopyov.com" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Your country</label>
                                                    <select class="select">
                                                        <option value="germany" selected="selected">Germany</option>
                                                        <option value="france">France</option>
                                                        <option value="spain">Spain</option>
                                                        <option value="netherlands">Netherlands</option>
                                                        <option value="other">...</option>
                                                        <option value="uk">United Kingdom</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Phone #</label>
                                                    <input type="text" value="+99-99-9999-9999" class="form-control">
                                                    <span class="help-block">+99-99-9999-9999</span>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="display-block">Upload profile image</label>
                                                    <input type="file" class="file-styled">
                                                    <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Save <i class="icon-arrow-right14 position-right"></i></button>
                                        </div>
                                    </form>
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
                                        <ul class="icons-list">
                                            <li><a data-action="collapse"></a></li>
                                            <li><a data-action="reload"></a></li>
                                            <li><a data-action="close"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <form action="#">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Username</label>
                                                    <input type="text" value="Eugene" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Full name</label>
                                                    <input type="text" value="Kopyov" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Address line 1</label>
                                                    <input type="text" value="Ring street 12" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Address line 2</label>
                                                    <input type="text" value="building D, flat #67" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>City</label>
                                                    <input type="text" value="Munich" class="form-control">
                                                </div>
                                                <div class="col-md-4">
                                                    <label>State/Province</label>
                                                    <input type="text" value="Bayern" class="form-control">
                                                </div>
                                                <div class="col-md-4">
                                                    <label>ZIP code</label>
                                                    <input type="text" value="1031" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                    <input type="text" readonly="readonly" value="eugene@kopyov.com" class="form-control">
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Your country</label>
                                                    <select class="select">
                                                        <option value="germany" selected="selected">Germany</option>
                                                        <option value="france">France</option>
                                                        <option value="spain">Spain</option>
                                                        <option value="netherlands">Netherlands</option>
                                                        <option value="other">...</option>
                                                        <option value="uk">United Kingdom</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Phone #</label>
                                                    <input type="text" value="+99-99-9999-9999" class="form-control">
                                                    <span class="help-block">+99-99-9999-9999</span>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="display-block">Upload profile image</label>
                                                    <input type="file" class="file-styled">
                                                    <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Save <i class="icon-arrow-right14 position-right"></i></button>
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
                        <img src="assets/images/placeholder.jpg" alt="">
                        <div class="caption">
                            <span>
                                <a href="#" class="btn bg-success-400 btn-icon btn-xs" data-popup="lightbox"><i class="icon-plus2"></i></a>
                                <a href="user_pages_profile.html" class="btn bg-success-400 btn-icon btn-xs"><i class="icon-link"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="caption text-center">
                        <h6 class="text-semibold no-margin">Hanna Dorman <small class="display-block">UX/UI designer</small></h6>
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
    <!-- /content area -->
</asp:Content>
