<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="URLAudit.aspx.cs" Inherits="Effigy.Web.DataEntry.URLAudit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <input type="text" class="form-control" placeholder="Website Name">
                                </div>
                                <div class="col-lg-3 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Website Status</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Address</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">City</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Kind of Business</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>

                            </div>


                            <!-- End form row 1 -->
                            <div class="form-group">
                                <div class="col-lg-3 col-xs-12">
                                    <input type="text" class="form-control" placeholder="Email Id">
                                </div>
                                <div class="col-lg-3 col-xs-12">
                                    <input type="text" class="form-control" placeholder="Phone No.">
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <input type="text" class="form-control" placeholder="Country">
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">State</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Company </option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>

                            </div>
                            <!-- End form row 2 -->

                            <div class="form-group">
                                <div class="col-lg-3 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Name of Prod</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-3 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Image of Prod</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-2 col-xs-12">
                                    <select name="select" class="form-control">
                                        <option value="opt1">Desc. of Prod</option>
                                        <option value="opt2">Option 2</option>
                                        <option value="opt3">Option 3</option>
                                        <option value="opt4">Option 4</option>

                                    </select>
                                </div>
                                <div class="col-lg-4 col-xs-12">
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Submit <i class="icon-arrow-right14 position-right"></i></button>
                                        <button type="reset" class="btn btn-primary">Reset <i class="icon-arrow-right14 position-right"></i></button>
                                    </div>
                                </div>


                            </div>
                            <!-- End of row 3 -->
                    </form>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <iframe src="http://www.aajtak.com" style="border: 1px solid #ddd; width: 100%; height: 800px"></iframe>
            </div>
        </div>

    </div>
</asp:Content>
