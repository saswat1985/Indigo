<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="PaymentFailure.aspx.cs" Inherits="Effigy.Web.Payment.PaymentFailure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="row">                    
                    <div class="col-md-3" style="text-align:center">
                    <img src="../images/payment-fail-img.png" class="img-responsive" /> 
                   </div>
                    <div class="col-md-8"> 
                        <span class="headingMessage text-center">Sorry! Your payment for  <span id="spnAmount" runat="server"></span> is not completed. Try After Sometime.</span>                 
                   </div>              
                </div>   
</asp:Content>
