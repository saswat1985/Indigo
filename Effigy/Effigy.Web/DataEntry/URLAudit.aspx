<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="URLAudit.aspx.cs" Inherits="Effigy.Web.DataEntry.URLAudit" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../CustomScript/UrlAudit.js"></script>
            <div class="panel panel-flat">
                <div class="panel-heading">
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <form class="form-horizontal" action="#">

                                <fieldset class="content-group">
                                    <div class="form-group">
                                        <div class="col-lg-3 col-xs-12">
                                            <input id="txtWebSiteName" class="form-control" placeholder="Website Name" type="text" />
                                        </div>
                                        <div class="col-lg-3 col-xs-12">
                                            <select id="ddlWebSiteStatus" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                            <select id="ddlIsAddress" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                              <select id="ddlIsCity" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                              <select id="ddlBusinessType" class="form-control" >                                               
                                            </select>
                                        </div>

                                    </div>


                                    <!-- End form row 1 -->
                                    <div class="form-group">
                                        <div class="col-lg-3 col-xs-12">
                                            <input id="txtEmail" class="form-control" placeholder="Email Id" type="text" />
                                        </div>
                                        <div class="col-lg-3 col-xs-12">
                                            <input id="txtPhone" class="form-control" placeholder="Phone No." type="text" />
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                             <select id="ddlIsCountry" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                             <select id="ddlIsState" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                             <select id="ddlIsCompanyProfile" class="form-control" >                                               
                                            </select>
                                        </div>

                                    </div>
                                    <!-- End form row 2 -->

                                    <div class="form-group">
                                        <div class="col-lg-3 col-xs-12">
                                            <select id="ddlNameProduct" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-3 col-xs-12">
                                            <select id="ddlImageProduct" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                            <select id="ddlDescProduct" class="form-control" >                                               
                                            </select>
                                        </div>
                                        <div class="col-lg-4 col-xs-12">
                                            <input id="txtComment" class="form-control" placeholder="Comments" type="text" />
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <div class="col-lg-3 col-xs-12">
                                           
                                        </div>
                                        <div class="col-lg-3 col-xs-12">
                                          
                                        </div>
                                        <div class="col-lg-2 col-xs-12">
                                          
                                        </div>
                                        <div class="col-lg-4 col-xs-12">
                                            <div class="text-right">
                                                <input id="btnSave" class="btn btn-primary" type="button" value="Submit" />
                                                <input id="btnReset" class="btn btn-primary" type="button" value="Reset" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of row 3 -->
                                </fieldset>


                            </form>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">

                        <iframe id="ctrIframe" style="border: 1px solid #ddd; width: 100%; height: 800px"></iframe>
                    </div>
                </div>

            </div>
</asp:Content>
