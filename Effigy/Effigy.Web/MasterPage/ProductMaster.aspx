<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="Effigy.Web.MasterPage.ProductMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../CustomScript/ProductMaster.js"></script>
    <div class="content">
        <!-- Pagination types -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h5 class="panel-title">Product List</h5>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a onclick="FillGridView();" data-action="reload"></a></li>
                        <li><a class="icon-plus22" data-toggle="modal" data-target="#modal_form_vertical"></a></li>
                    </ul>
                </div>
            </div>
            <div id="dvGrid" class="panel-body">
                <!-- gridview start  -->

                <!-- gridview End  -->
            </div>



        </div>
        <!-- /pagination types -->
        <!-- Vertical form modal -->
        <div id="modal_form_vertical" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h5 class="modal-title">Add Product</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" style="padding-top: 20px">
                            <label class="col-lg-3 control-label">Product Code: <span class="asterisk" style="color: red">*</span></label>
                            <div class="col-lg-5">
                                <input id="txtProductCode" runat="server" type="text" class="form-control" disabled="disabled" />
                            </div>
                        </div>
                        <div class="form-group" style="padding-top: 20px">
                            <label class="col-lg-3 control-label">Product Name: <span class="asterisk" style="color: red">*</span></label>
                            <div class="col-lg-5">
                                <input id="txtProductName" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group" style="padding-top: 20px">
                            <label class="col-lg-3 control-label">Joining Price: <span class="asterisk" style="color: red">*</span></label>
                            <div class="col-lg-5">
                                <input id="txtJoiningPrice" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group" style="padding-top: 20px">
                            <label class="col-lg-3 control-label">Member Intro Per.: <span class="asterisk" style="color: red">*</span></label>
                            <div class="col-lg-5">
                                <input id="txtInroPercentage" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group" style="padding-top: 20px">
                            <label class="col-lg-3 control-label">Member Work Per.: <span class="asterisk" style="color: red">*</span></label>
                            <div class="col-lg-5">
                                <input id="txtWorkPer" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group" style="padding-top: 20px">
                            <label class="col-lg-3 control-label">Product Desc: <span class="asterisk" style="color: red">*</span></label>
                            <div class="col-lg-5">
                                <input id="txtDesc" type="text" class="form-control" />
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer" style="padding-right: 30px">
                        <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                        <button id="btnSave" type="button" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>
                    </div>

                </div>
            </div>
        </div>
        <!-- /vertical form modal -->
    </div>
</asp:Content>
