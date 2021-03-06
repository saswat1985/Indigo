﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Effigy.Web.Login" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Traderz Planet</title>

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
    <link rel="shortcut icon" type="image/x-icon" href="Images/tp_icon_Febicon.ico" />
    <!-- Theme JS files -->
    <script type="text/javascript" src="assets/js/core/app.js"></script>
    <!-- /theme JS files -->

</head>
<body class="login-container">
    <form id="form1" runat="server">
        <!-- Main navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img src="Images/traderzPlanet.png" title="" alt="" width="90" />
                </a>

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
                        <a href="#" title="Contact support">
                            <i class="icon-user-tie"></i><span class="visible-xs-inline-block position-right"></span>
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

                        <!-- Simple login form -->
                        <form action="#">
                            <div class="panel panel-body login-form">
                                <div class="text-center">
                                    <div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
                                    <h5 class="content-group">Login to your account <small class="display-block">Enter your credentials below</small></h5>
                                </div>

                                <div class="form-group has-feedback has-feedback-left">
                                    <asp:TextBox ID="txtUserName" ClientIDMode="Static" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>

                                    <div class="form-control-feedback">
                                        <i class="icon-user text-muted"></i>
                                    </div>
                                </div>

                                <div class="form-group has-feedback has-feedback-left">
                                    <asp:TextBox ID="txtPwd" ClientIDMode="Static" CssClass="form-control" placeholder="Password" MaxLength="20" TextMode="Password" runat="server"></asp:TextBox>

                                    <div class="form-control-feedback">
                                        <i class="icon-lock2 text-muted"></i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />

                                </div>
                                <div class="text-center">
                                    <asp:Label ID="lblMessage" runat="server" CssClass="validation"></asp:Label>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <ul class="list-inline list-half">
                                            <li><a href="ForgetPassword.aspx" class="">Forgot password?</a></li>
                                            <li class="text-right"><a href="UserRegstration.aspx" class="">Register here</a></li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- /simple login form -->


                        <!-- Footer -->
                        <div class="footer text-muted text-center">
                            &copy; Copyright 2018. <a href="#">Powered</a> by <a href="#" target="_blank">TraderzPlanet</a>
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
       

    </form>
</body>
</html>
