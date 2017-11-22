<%@ Page Title="" Language="C#" MasterPageFile="~/EffigyMaster.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="Effigy.Web.DashBoard.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../CustomScript/Dashboard.js"></script>   	
						<div class="page-container" style="min-height:328px">

		<!-- Page content -->
		<div class="page-content">			
			<!-- Main content -->
			<div class="content-wrapper">				
				<!-- Content area -->
				<div class="content">				

					<!-- Dashboard content -->
					<div class="row">
						<div class="col-lg-12">						

							<!-- Quick stats boxes -->
							<div class="row">
								<div class="col-lg-3">

									<!-- Members online -->
									<div class="panel bg-teal-400">
										<div class="panel-body">
											<div class="heading-elements">
												<span class="heading-text badge bg-teal-800">+53,6%</span>
											</div>

											<h3 class="no-margin">3,450</h3>
											Total referred members
											<div class="text-muted text-size-small">489 avg</div>
										</div>

										<div class="container-fluid">
											<div id="members-online"></div>
										</div>
									</div>
									<!-- /members online -->

								</div>

								<div class="col-lg-3">

									<!-- Current server load -->
									<div class="panel bg-pink-400">
										<div class="panel-body">
											<div class="heading-elements">
												<ul class="icons-list">
							                		<li class="dropdown">
							                			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog3"></i> <span class="caret"></span></a>
														<ul class="dropdown-menu dropdown-menu-right">
															<li><a href="#"><i class="icon-sync"></i> Update data</a></li>															
														</ul>
							                		</li>
							                	</ul>
											</div>

											<h3 class="no-margin">49</h3>
											Total Input Data
											<div class="text-muted text-size-small">34 avg/month</div>
										</div>

										<div id="server-load"></div>
									</div>
									<!-- /current server load -->

								</div>

								<div class="col-lg-3">

									<!-- Today's revenue -->
									<div class="panel bg-blue-400">
										<div class="panel-body">
											<div class="heading-elements">
												<ul class="icons-list">
							                		<li><a data-action="reload"></a></li>
							                	</ul>
						                	</div>

											<h3 class="no-margin">18,390</h3>
											Today's revenue
											<div class="text-muted text-size-small">37,578 avg</div>
										</div>

										<div id="today-revenue"></div>
									</div>
									<!-- /today's revenue -->

								</div>
							<div class="col-lg-3">

	<!-- Today's revenue -->
									<div class="panel bg-green-600">
										<div class="panel-body">
											<div class="heading-elements">
												<ul class="icons-list">
							                		<li><a data-action="reload"></a></li>
							                	</ul>
						                	</div>

											<h3 class="no-margin">18,390</h3>
											Today's revenue
											<div class="text-muted text-size-small">37,578 avg</div>
										</div>

										<div id="today-revenue"></div>
									</div>
									<!-- /today's revenue -->

								</div>
							
							
							</div>
							<!-- /quick stats boxes -->


						</div>

					</div>
					<!-- /dashboard content -->


					

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
    <!-- Vertical form modal -->
    <div id="modal_form_vertical" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h5 class="modal-title">Payment Information</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="row">
                            <div class="col-md-12">
                                <ul style="margin-left: 10px;">
                                    <li>your Payment is pending till now. Kindly Click For Payment</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal" id="btnClose">Close</button>
                    <asp:Button ID="btnPayment" runat="server" Text="Payment" CssClass="btn btn-primary" OnClick="btnPayment_Click" />
                   <%-- <button id="btnPayment" type="button" class="btn btn-primary">Payment<i class="icon-arrow-right14 position-right"></i></button>--%>

                </div>
            </div>
        </div>
    </div>
    <!-- /vertical form modal -->
</asp:Content>
