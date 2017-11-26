<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="Effigy.Web.Payment.PaymentSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-3" style="text-align: center">
            <img src="../images/payment-suc-img.png" class="img-responsive" />
        </div>
        <div class="col-md-8">
            <span class="headingMessage text-center">Congratulations! Your payment for  <span id="spnAmount" runat="server"></span>is successful.</span>
        </div>
    </div>
</asp:Content>
