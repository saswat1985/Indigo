<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="Effigy.Web.DashBoard.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../CustomScript/Dashboard.js"></script>
    <!-- Vertical form modal -->
    <div id="modal_form_vertical" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h5 class="modal-title">Payment Information</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="row">
                            <div class="col-md-12">
                                <ul style="margin-left: 10px;">
                                    <li>your Payment is pending till now. Kindly Click For Payment</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal" id="btnClose">Close</button>
                    <asp:Button ID="Button1" runat="server" Text="Payment" CssClass="btn btn-primary" OnClick="btnPayment_Click" />
                   <%-- <button id="btnPayment" type="button" class="btn btn-primary">Payment<i class="icon-arrow-right14 position-right"></i></button>--%>

                </div>
            </div>
        </div>
    </div>
    <!-- /vertical form modal -->
</asp:Content>
