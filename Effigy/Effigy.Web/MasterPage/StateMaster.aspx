<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="StateMaster.aspx.cs" Inherits="Effigy.Web.MasterPage.StateMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../CustomScript/StateMaster.js"></script>     
    <div class="content">
        <!-- Pagination types -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h5 class="panel-title">State List</h5>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a onclick="FillGridView();" data-action="reload"></a></li>
                        <li><a class="icon-plus22" data-toggle="modal" data-target="#modal_form_vertical"></a></li>
                    </ul>
                </div>
            </div>
            <div id="dvGrid" class="panel-body">
            </div>
        </div>
        <!-- /pagination types -->
    </div>
    <!-- Vertical form modal -->
    <div id="modal_form_vertical" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h5 class="modal-title">Add State</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group" style="padding-top: 10px;">
                        <label class="col-lg-3 control-label">Country Name: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" TabIndex="1" ClientIDMode="Static"  required>
                            </asp:DropDownList>
                        </div>
                        
                    </div>
                    <div class="form-group" style="padding-top: 23px;">
                        <label class="col-lg-3 control-label">State Name: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtStateName" runat="server" ClientIDMode="Static" CssClass="form-control" TabIndex="2" placeholder="State Name" required></asp:TextBox>
                          
                        </div>
                    </div>

                </div>

                <div class="modal-footer" style="padding-right: 30px;padding-top: 5px;">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    <button id="btnSave" type="button" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>
                </div>

            </div>
        </div>
    </div>
    <!-- /vertical form modal -->
</asp:Content>
