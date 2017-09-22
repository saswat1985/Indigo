<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegstration.aspx.cs" Inherits="Effigy.Web.UserRegstration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Effigy</title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/colors.css" rel="stylesheet" type="text/css" />
    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
    <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>

    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>

    <script type="text/javascript" src="assets/js/core/app.js"></script>
    <script type="text/javascript" src="assets/js/pages/login.js"></script>
    <script type="text/javascript" src="CustomScript/UserRegistration.js"></script>
    <!-- /theme JS files -->
</head>
<body class="login-container">
    <!-- Main navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.html">
                <img src="assets/images/logo_light.png" alt=""></a>

            <ul class="nav navbar-nav pull-right visible-xs-block">
                <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
            </ul>
        </div>

        <div class="navbar-collapse collapse" id="navbar-mobile">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="Index.aspx" title="Go to website">
                        <i class="icon-display4"></i><span class="visible-xs-inline-block position-right"></span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <i class="icon-user-tie"></i><span class="visible-xs-inline-block position-right">Contact admin</span>
                    </a>
                </li>


            </ul>
        </div>
    </div>
    <!-- /main navbar -->


    <!-- Page container -->
    <div class="page-container">

        <!-- Page content -->
        <div class="page-content">

            <!-- Main content -->
            <div class="content-wrapper">

                <!-- Content area -->
                <div class="content">

                    <!-- Registration form -->
                    <form id="form1" runat="server">
                        <div class="row">
                            <div class="col-lg-6 col-lg-offset-3">
                                <div class="panel registration-form">
                                    <div class="panel-body">
                                        <div class="text-center">
                                            <div class="icon-object border-success text-success"><i class="icon-plus3"></i></div>
                                            <h5 class="content-group-lg">Create account <small class="display-block">All fields are required</small></h5>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input id="txtFirstName" type="text" class="form-control" placeholder="First name" required />
                                                    <div class="form-control-feedback">
                                                        <i class="icon-user-check text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input id="txtLastName" type="text" class="form-control" placeholder="Last name" required />
                                                    <div class="form-control-feedback">
                                                        <i class="icon-user-check text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input id="txtMobileNo" type="text" class="form-control" placeholder="Mobile No" required />
                                                    <div class="form-control-feedback">
                                                        <i class="icon-mention text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input id="txtEmail" type="email" class="form-control" placeholder="email" required />
                                                    <div class="form-control-feedback">
                                                        <i class="icon-mention text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <asp:DropDownList ID="ddlCategory" ClientIDMode="Static" CssClass="form-control input-md" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input id="txtRefrelCode" type="text" class="form-control" placeholder="Refferal Code" />
                                                    <div class="form-control-feedback">
                                                        <i class="icon-key text-muted"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input id="chkAccept" type="checkbox" class="styled" />
                                                    Accept <a href="#">terms of service</a>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="text-right">
                                            <a href="Login.aspx" class="btn btn-link"><i class="icon-arrow-left13 position-left"></i>Back to login form</a>
                                            <button id="btnRegistartion" type="submit" class="btn bg-teal-400 btn-labeled btn-labeled-right ml-10"><b><i class="icon-paperplane"></i></b>Create account</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- /registration form -->


                    <!-- Footer -->
                    <div class="footer text-muted text-center">
                        &copy; 2017. <a href="#">Powered</a> by <a href="http://themeforest.net/user/Kopyov" target="_blank">Effigy</a>
                    </div>
                    <!-- /footer -->

                </div>
                <!-- /content area -->

            </div>
            <!-- /main content -->

        </div>
        <!-- /page content -->

    </div>
    <!-- /page container -->

</body>
</html>
