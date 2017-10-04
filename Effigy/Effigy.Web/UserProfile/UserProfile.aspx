<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Effigy.Web.UserProfile.UserProfile" %>
<%@ Register TagPrefix="uc" TagName="UserProfile" Src="~/UserControl/UC_UserProfile.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../CustomScript/UserProfile.js"></script>
   <uc:UserProfile  ID="ucUserProfile" runat="server"/>
</asp:Content>
