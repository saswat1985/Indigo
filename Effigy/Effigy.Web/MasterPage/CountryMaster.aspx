<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="CountryMaster.aspx.cs" Inherits="Effigy.Web.MasterPage.CountryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../CustomScript/CountryMaster.js"></script>
    <div class="content">
        <!-- Pagination types -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h5 class="panel-title">Country List</h5>
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a onclick="FillGridView();" data-action="reload"></a></li>
                        <li><a class="icon-plus22" data-toggle="modal" data-target="#modal_form_vertical"></a></li>
                    </ul>
                </div>
            </div>
            <div id="dvGrid" class="panel-body">
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
                    <h5 class="modal-title">Add Country</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Country Name</label>
                            </div>
                            <div class="col-sm-9">
                                <input id="txtCountryName" name="txtCountryName" class="form-control" placeholder="Country Name" type="text" />
                                <%-- <asp:TextBox ID="txtCountryName" runat="server" ClientIDMode="Static" CssClass="form-control" TabIndex="1" placeholder="Country Name" required></asp:TextBox>--%>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    <button id="btnSave" type="button" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>

                </div>
            </div>
        </div>
    </div>
    <!-- /vertical form modal -->
</asp:Content>
