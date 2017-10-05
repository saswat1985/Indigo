<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="UrlEntry.aspx.cs" Inherits="Effigy.Web.DataEntry.UrlEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">

        <%-- <!-- Basic tabs title -->
        <h6 class="content-group text-semibold">Basic tabs layout
						<small class="display-block">Default tabs layout options</small>
        </h6>
        <!-- /basic tabs title -->--%>


        <!-- Basic tabs -->
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-flat">
                    <div class="panel-heading">
                        <h6 class="panel-title">URL Data Entry</h6>
                        <div class="heading-elements">
                            <ul class="icons-list">
                                <li><a data-action="collapse"></a></li>
                                <li><a data-action="reload"></a></li>                                
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body">
                        <div class="tabbable">
                            <ul class="nav nav-tabs nav-justified">
                                <li class="active"><a href="#basic-justified-tab1" data-toggle="tab">Manual URL</a></li>
                                <li><a href="#basic-justified-tab2" data-toggle="tab">Upload from Excel</a></li>

                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="basic-justified-tab1">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <label><b>Enter URL</b></label>
                                            <textarea rows="25" cols="5" class="form-control" placeholder="Enter URL"></textarea>
                                        </div>
                                        <div class="col-sm-5">
                                            <label><b>Result Area</b></label>                                           
                                            <textarea rows="25" cols="5" class="form-control" placeholder="URL Entry Result" disabled="disabled"></textarea>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="row">
                                                <label class="col-sm-12"><b>Summary</b></label>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-8"><b>Total No of URLs:</b></label>
                                                <label class="col-sm-4"><b>100</b></label>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-8"><b>Duplicate URLs:</b></label>
                                                <label class="col-sm-4"><b>100</b></label>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-8"><b>Unique unit URLs:</b></label>
                                                <label class="col-sm-4"><b>10</b></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-right">
                                            <button class="btn btn-success btn-mini" style="min-width: 120px">Save</button>
                                            <button class="btn btn-danger btn-mini " style="min-width: 120px">Reset</button>
                                        </div>
                                    </div>



                                </div>

                                <div class="tab-pane" id="basic-justified-tab2">
                                    <div class="row marginTop15">
                                        <div class="col-sm-4">
                                            <label><b>Enter URL</b></label>
                                            <div class="uploader">
                                                <input type="file" class="file-styled-primary"><span class="filename" style="user-select: none;">No file selected</span><span class="action btn bg-blue" style="user-select: none;">Choose File</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <label><b>Result Area</b></label>
                                             <textarea rows="25" cols="5" class="form-control" placeholder="URL Entry Result" disabled="disabled"></textarea>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="row">
                                                <label class="col-sm-12"><b>Summary</b></label>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-8"><b>Total No of URLs:</b></label>
                                                <label class="col-sm-4"><b>100</b></label>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-8"><b>Duplicate URLs:</b></label>
                                                <label class="col-sm-4"><b>100</b></label>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-8"><b>Unique unit URLs:</b></label>
                                                <label class="col-sm-4"><b>10</b></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-right">
                                            <button class="btn btn-success btn-mini" style="min-width: 120px">Save</button>
                                            <button class="btn btn-danger btn-mini " style="min-width: 120px">Reset</button>
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /basic tabs -->



    </div>
</asp:Content>
