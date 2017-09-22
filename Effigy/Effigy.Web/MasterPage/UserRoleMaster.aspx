<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="UserRoleMaster.aspx.cs" Inherits="Effigy.Web.MasterPage.UserRoleMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../CustomScript/UserRoleMaster.js"></script>
    <div class="content">
        <!-- Pagination types -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h5 class="panel-title">User Role List</h5>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a onclick="FillGridView();" data-action="reload"></a></li>
                        <li><a class="icon-plus22" data-toggle="modal" data-target="#modal_form_vertical" onclick="ResetControls();"></a></li>
                    </ul>
                </div>
            </div>
            <div id="dvGrid" class="panel-body">
                <!-- gridview start  -->

                <!-- gridview End  -->
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
                    <h5 class="modal-title">Add User Role</h5>
                </div>
                <%--RoleId, RoleName, Description, IsActive--%>
                <div class="modal-body">
                    <div class="form-group" style="padding-top: 20px">
                        <label class="col-lg-3 control-label">Role Name: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9">
                            <input type="text" id="txtRoleName" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group" style="padding-top: 20px">
                        <label class="col-lg-3 control-label">Description: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9">
                            <input type="text" id="txtDescription" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group" style="padding-top: 20px">
                        <label class="col-lg-3 control-label">Active: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9">
                            <select id="ddlIsActive" class="form-control"><option value="0">No</option><option value="1">Yes</option></select>
                        </div>
                    </div>
                    <input id="hidRoleId" type="hidden" />
                </div>

                <div class="modal-footer" style="padding-right: 30px">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    <button id="btnSave" type="button" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>
                </div>

            </div>
        </div>
    </div>
    <!-- /vertical form modal -->
</asp:Content>
