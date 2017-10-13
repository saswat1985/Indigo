<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="UsersListPage.aspx.cs" Inherits="Effigy.Web.UserProfile.UsersListPage" %>
<%@ Register TagPrefix="uc" TagName="UserProfile" Src="~/UserControl/UC_UserProfile.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../CustomScript/UserListPage.js"></script>
    <div class="content">
        <!-- Pagination types -->
        <div class="panel panel-flat" id="divUsersList">
            <div class="panel-heading">
                <h5 class="panel-title">Users List</h5>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a onclick="FillGridView();" data-action="reload"></a></li>
                        <li><a class="icon-plus22" onclick="AddNewProfile();"></a></li>
                    </ul>
                </div>
            </div>
            <div id="dvGrid" class="panel-body">
            </div>
        </div>
        <!-- /pagination types -->
        <div id="dvDetails" style="display: none">
            <uc:UserProfile ID="ucUserProfile" runat="server" />
        </div>
    </div>

</asp:Content>
