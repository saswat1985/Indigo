<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentGetway.aspx.cs" Inherits="Effigy.Web.Payment.PaymentGetway" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Getways</title>
    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/colors.css" rel="stylesheet" type="text/css" />
    <!-- /global stylesheets -->
    <!-- Core JS files -->
    <script type="text/javascript" src="../assets/js/plugins/loaders/pace.min.js"></script>
    <script type="text/javascript" src="../assets/js/core/libraries/jquery.min.js"></script>
    <script type="text/javascript" src="../assets/js/core/libraries/bootstrap.min.js"></script>
    <script type="text/javascript" src="../assets/js/plugins/loaders/blockui.min.js"></script>
    <script type="text/javascript" src="../CustomScript/PaymentGetway.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="../assets/js/core/app.js"></script>
    <!-- /theme JS files -->
</head>
<body>
     <!-- Page container -->
    <div class="page-container">
        <!-- Page content -->
        <div class="page-content">
            <!-- Main content -->
            <div class="content-wrapper">
                <!-- Content area -->
                <div class="content">
                    <!-- Payment form -->
                    <form id="form1" runat="server">
                        <input type="hidden" runat="server" id="key" name="key" />
                        <input type="hidden" runat="server" id="hash" name="hash" />
                        <input type="hidden" runat="server" id="txnid" name="txnid" />
                        <input type="hidden" runat="server" id="enforce_paymethod" name="enforce_paymethod" />
                        <div class="row">
                            <div class="col-lg-6 col-lg-offset-3">
                                <div class="panel registration-form">
                                    <div class="panel-body">
                                        <div class="text-center">
                                            <div class="icon-object border-success text-success"><i class="icon-plus3"></i></div>
                                            <h5 class="content-group-lg">Payment Getway</h5>
                                             <br />
                                        </div>
                                        <div id="frmError" runat="server" class="row">
                                            <span style="color: red; margin-left: 15px;">Please fill all mandatory fields.</span>                                           
                                        </div>
                                        <div class="row" style="padding-top:10px">
                                            <div class="col-sm-2">
                                                <label>Product :</label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:Label ID="txtProductInfo" runat="server"></asp:Label>
                                            </div>
                                            <div class="col-sm-2">
                                                <label>Amount:</label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:Label ID="txtAmount" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top:10px">
                                            <div class="col-sm-2">
                                                <label>Mobile:<span class="asterisk" style="color: red">*</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="" TabIndex="4"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                <label>Email:<span class="asterisk" style="color: red">*</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="" TabIndex="3"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top:10px">

                                            <div class="col-sm-2">
                                                <label>First Name:<span class="asterisk" style="color: red">*</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtfirstName" runat="server" CssClass="form-control" placeholder="" TabIndex="2"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                <label>Last Name:</label>
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="" TabIndex="9"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top:10px;display:none">                                            
                                                <div class="col-sm-2">
                                                    <label>Address:<span class="asterisk" style="color: red">*</span></label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txtUDF1" runat="server" CssClass="form-control" placeholder="" TabIndex="16"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label>Pin Code<span class="asterisk" style="color: red">*</span></label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <asp:TextBox ID="txtUDF2" runat="server" CssClass="form-control" placeholder="" TabIndex="20"></asp:TextBox>
                                                </div>
                                            </div>                                        

                                        <div class="row" style="display: none">
                                            <div class="col-sm-2">
                                                Address1:                             
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" placeholder="" TabIndex="10"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                Address2: 
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" placeholder="" TabIndex="11"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">
                                            <div class="col-sm-2">
                                                City:                             
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="" TabIndex="12"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                State:
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="" TabIndex="13"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">
                                            <div class="col-sm-2">
                                                Country:                             
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="" TabIndex="14"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                Zipcode:
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" placeholder="" TabIndex="15"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">
                                            <div class="col-sm-2">
                                                UDF3:
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtUDF3" runat="server" CssClass="form-control" placeholder="" TabIndex="17"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                UDF4                             
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtUDF4" runat="server" CssClass="form-control" placeholder="" TabIndex="18"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">
                                            <div class="col-sm-2">
                                                UDF5:
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtUDF5" runat="server" CssClass="form-control" placeholder="" TabIndex="19"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                Cancel URI:                     
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtCancelURI" runat="server" CssClass="form-control" placeholder="" TabIndex="8"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">
                                            <div class="col-sm-2">
                                                PG:
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtPg" runat="server" CssClass="form-control" placeholder="" TabIndex="21"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                Service Provider:                              
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="service_provider" runat="server" Text="payu_paisa" CssClass="form-control" placeholder="" TabIndex="22"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">

                                            <div class="col-sm-2" style="display: none">
                                                Success URI:                             
                                            </div>
                                            <div class="col-sm-4" style="display: none">
                                                <asp:TextBox ID="txtSucessURI" runat="server" CssClass="form-control" placeholder="" TabIndex="6"></asp:TextBox>
                                            </div>

                                            <div class="col-sm-2">
                                                Failure URI:
                                            </div>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtFailerURI" runat="server" CssClass="form-control" placeholder="" TabIndex="7"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="text-right" style="padding-top:10px">
                                            <asp:Button ID="btnPayment" runat="server" class="btn btn-primary" Text="Confirm Payment" OnClick="btnPayment_Click"  />                      
                                             <asp:Button ID="btncancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btncancel_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- /Payment form -->

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
