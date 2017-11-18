﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="URLAudit.aspx.cs" Inherits="Effigy.Web.DataEntry.URLAudit" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-flat">
        <div class="panel-heading">
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-12">
                    <form class="form-horizontal" action="#">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <fieldset class="content-group">
                            <div class="form-group">
                                <div class="col-lg-3 col-xs-12">
                                    <asp:TextBox ID="txtWebSiteName" runat="server" CssClass="form-control" placeholder="Website Name" Enabled="false"></asp:TextBox>
                                </div>
                                <div class="col-lg-3 col-xs-12">
                                    <asp:DropDownList ID="ddlWebSiteStatus" runat="server" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="WebSiteStatusChange" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlIsAddress" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>

                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlIsCity" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlBusinessType" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>

                                </div>

                            </div>


                            <!-- End form row 1 -->
                            <div class="form-group">
                                <div class="col-lg-3 col-xs-12">
                                    <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                                </div>
                                <div class="col-lg-3 col-xs-12">
                                    <asp:TextBox ID="txtPhone" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Phone No."></asp:TextBox>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlIsCountry" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlIsState" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlIsCompanyProfile" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                </div>

                            </div>
                            <!-- End form row 2 -->

                            <div class="form-group">
                                <div class="col-lg-3 col-xs-12">
                                    <asp:DropDownList ID="ddlNameProduct" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-lg-3 col-xs-12">
                                    <asp:DropDownList ID="ddlImageProduct" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>

                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <asp:DropDownList ID="ddlDescProduct" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4 col-xs-12">
                                    <div class="text-right">
                                        <asp:Button ID="btnSubmit" runat="server" OnClick="SubmitClick" class="btn btn-primary" Text="Submit" />
                                        <asp:Button ID="btnReset" runat="server" OnClick="ResetClick" class="btn btn-primary" Text="Reset" />
                                    </div>
                                </div>
                            </div>
                            <!-- End of row 3 -->
                        </fieldset>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                                <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="click" />
                                <asp:AsyncPostBackTrigger ControlID="ddlWebSiteStatus" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        
                    </form>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <iframe id="ctrIframe" runat="server" style="border: 1px solid #ddd; width: 100%; height: 800px"></iframe>
            </div>
        </div>

    </div>
</asp:Content>
