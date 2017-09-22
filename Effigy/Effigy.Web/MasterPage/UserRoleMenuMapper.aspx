<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="UserRoleMenuMapper.aspx.cs" Inherits="Effigy.Web.MasterPage.UserRoleMenuMapper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <script type="text/javascript" src="../CustomScript/MenuRoleMapper.js"></script>
    <div class="content">
        <!-- Pagination types -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h5 class="panel-title">User role-menu mapper</h5>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a  data-action="reload"></a></li>
                        <li><a class="icon-plus22" data-toggle="modal" data-target="#modal_form_vertical" ></a></li>
                    </ul>
                </div>
            </div>
            <div id="dvGrid" class="panel-body">
                <div class="form-group" style="padding-top: 20px">
                        <label class="col-lg-3 control-label">Role Name: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9">
                            <select id="ddlUserRole" class="form-control"></select>
                        </div>
                    </div>
                    <div class="form-group" style="padding-top: 20px">
                        <label class="col-lg-3 control-label">Menu: <span class="asterisk" style="color: red">*</span></label>
                        <div class="col-lg-9" id="divMenuRole"></div>
                    </div>
                 <div class="modal-footer" style="padding-right: 30px">
                    <button id="btnSave" type="button" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>
                </div>
            </div>



        </div>
        <!-- /pagination types -->
    </div>
    <!-- Vertical form modal -->
    
    <!-- /vertical form modal -->
</asp:Content>
