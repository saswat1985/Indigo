<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Effigy.Web.UserProfile.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../CustomScript/UpdatePassword.js"></script>
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h6 class="panel-title">Change Password<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label>Username</label>
                        <asp:TextBox ID="txtUserName" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label>New password</label>
                        <input type="password" id="txtPassword" placeholder="Enter new password" class="form-control" />
                    </div>
                    <div class="col-md-6">
                        <label>Repeat password</label>
                        <input type="password" id="txtConfirmPassword" placeholder="Repeat new password" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="text-right">
                <button type="button" id="btnSave" class="btn btn-primary">Update My Password <i class="icon-arrow-right14 position-right"></i></button>
            </div>
        </div>
    </div>
</asp:Content>

