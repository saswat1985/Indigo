<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_UserProfileNew.ascx.cs" Inherits="Effigy.Web.UserControl.UC_UserProfileNew" %>
<!-- Page container -->
<div class="page-container">

    <!-- Page content -->
    <div class="page-content">



        <!-- Main content -->
        <div class="content-wrapper">
            <!-- Content area -->
            <div class="content">

                <!-- Basic setup -->
                <div class="panel panel-white">
                    <div class="panel-heading">
                        <h6 class="panel-title">User Registration</h6>
                        <div class="heading-elements">
                            <ul class="icons-list">
                                <li><a data-action="collapse"></a></li>
                                <li><a data-action="reload"></a></li>                               
                            </ul>
                        </div>
                    </div>

                    <form class="form-basic" action="#">
                        <fieldset class="step" id="step1">
                            <h6 class="form-wizard-title text-semibold">
                                <span class="form-wizard-count">1</span>
                                Personal info
                                    <small class="display-block">Tell us a bit about yourself</small>
                            </h6>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select location:</label>
                                        <select name="location" data-placeholder="Select position" class="select">
                                            <option></option>
                                            <optgroup label="North America">
                                                <option value="1">United States</option>
                                                <option value="2">Canada</option>
                                            </optgroup>

                                            <optgroup label="Europe">
                                                <option value="8">Croatia</option>
                                                <option value="9">Hungary</option>
                                                <option value="10">Ukraine</option>
                                                <option value="11">Greece</option>
                                                <option value="12">Norway</option>
                                                <option value="13">Germany</option>
                                                <option value="14">United Kingdom</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select position:</label>
                                        <select name="position" data-placeholder="Select position" class="select">
                                            <option></option>
                                            <optgroup label="Developer Relations">
                                                <option value="1">Sales Engineer</option>
                                                <option value="2">Ads Solutions Consultant</option>
                                                <option value="3">Technical Solutions Consultant</option>
                                                <option value="4">Business Intern</option>
                                            </optgroup>

                                            <optgroup label="Engineering &amp; Design">
                                                <option value="5">Interaction Designer</option>
                                                <option value="6">Technical Program Manager</option>
                                                <option value="7">Software Engineer</option>
                                                <option value="8">Information Security Engineer</option>
                                                <option value="9">Security Engineer</option>
                                                <option value="10">Usability Expert</option>
                                                <option value="11">UI Designer</option>
                                                <option value="12">Illustrator</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Applicant name:</label>
                                        <input type="text" name="name" class="form-control" placeholder="John Doe">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email address:</label>
                                        <input type="email" name="email" class="form-control" placeholder="your@email.com">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone #:</label>
                                        <input type="text" name="tel" class="form-control" placeholder="+99-99-9999-9999" data-mask="+99-99-9999-9999">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Date of birth:</label>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <select name="birth-month" data-placeholder="Month" class="select">
                                                    <option></option>
                                                    <option value="1">January</option>
                                                    <option value="2">February</option>
                                                    <option value="3">March</option>
                                                    <option value="4">April</option>
                                                    <option value="5">May</option>
                                                    <option value="6">June</option>
                                                    <option value="7">July</option>
                                                    <option value="8">August</option>
                                                    <option value="9">September</option>
                                                    <option value="10">October</option>
                                                    <option value="11">November</option>
                                                    <option value="12">December</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <select name="birth-day" data-placeholder="Day" class="select">
                                                    <option></option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="...">...</option>
                                                    <option value="31">31</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <select name="birth-year" data-placeholder="Year" class="select">
                                                    <option></option>
                                                    <option value="1">1980</option>
                                                    <option value="2">1981</option>
                                                    <option value="3">1982</option>
                                                    <option value="4">1983</option>
                                                    <option value="5">1984</option>
                                                    <option value="6">1985</option>
                                                    <option value="7">1986</option>
                                                    <option value="8">1987</option>
                                                    <option value="9">1988</option>
                                                    <option value="10">1989</option>
                                                    <option value="11">1990</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="step" id="step2">
                            <h6 class="form-wizard-title text-semibold">
                                <span class="form-wizard-count">2</span>
                                Your education
                                    <small class="display-block">Let us know about your degree</small>
                            </h6>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>University:</label>
                                        <input type="text" name="university" placeholder="University name" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Country:</label>
                                        <select name="university-country" data-placeholder="Choose a Country..." class="select">
                                            <option></option>
                                            <option value="1">United States</option>
                                            <option value="2">France</option>
                                            <option value="3">Germany</option>
                                            <option value="4">Spain</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Degree level:</label>
                                        <input type="text" name="degree-level" placeholder="Bachelor, Master etc." class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label>Specialization:</label>
                                        <input type="text" name="specialization" placeholder="Design, Development etc." class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>From:</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-from-month" data-placeholder="Month" class="select">
                                                            <option></option>
                                                            <option value="January">January</option>
                                                            <option value="...">...</option>
                                                            <option value="December">December</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-from-year" data-placeholder="Year" class="select">
                                                            <option></option>
                                                            <option value="1995">1995</option>
                                                            <option value="...">...</option>
                                                            <option value="1980">1980</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label>To:</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-to-month" data-placeholder="Month" class="select">
                                                            <option></option>
                                                            <option value="January">January</option>
                                                            <option value="...">...</option>
                                                            <option value="December">December</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-to-year" data-placeholder="Year" class="select">
                                                            <option></option>
                                                            <option value="1995">1995</option>
                                                            <option value="...">...</option>
                                                            <option value="1980">1980</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Language of education:</label>
                                        <input type="text" name="education-language" placeholder="English, German etc." class="form-control">
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="step" id="step3">
                            <h6 class="form-wizard-title text-semibold">
                                <span class="form-wizard-count">3</span>
                                Work experience
                                    <small class="display-block">Previous work places</small>
                            </h6>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Company:</label>
                                        <input type="text" name="experience-company" placeholder="Company name" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label>Position:</label>
                                        <input type="text" name="experience-position" placeholder="Company name" class="form-control">
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>From:</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-from-month" data-placeholder="Month" class="select">
                                                            <option></option>
                                                            <option value="January">January</option>
                                                            <option value="...">...</option>
                                                            <option value="December">December</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-from-year" data-placeholder="Year" class="select">
                                                            <option></option>
                                                            <option value="1995">1995</option>
                                                            <option value="...">...</option>
                                                            <option value="1980">1980</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label>To:</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-to-month" data-placeholder="Month" class="select">
                                                            <option></option>
                                                            <option value="January">January</option>
                                                            <option value="...">...</option>
                                                            <option value="December">December</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select name="education-to-year" data-placeholder="Year" class="select">
                                                            <option></option>
                                                            <option value="1995">1995</option>
                                                            <option value="...">...</option>
                                                            <option value="1980">1980</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Brief description:</label>
                                        <textarea name="experience-description" rows="4" cols="4" placeholder="Tasks and responsibilities" class="form-control"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label class="display-block">Recommendations:</label>
                                        <input name="recommendations" type="file" class="file-styled">
                                        <span class="help-block">Accepted formats: pdf, doc. Max file size 2Mb</span>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="step" id="step4">
                            <h6 class="form-wizard-title text-semibold">
                                <span class="form-wizard-count">4</span>
                                Additional info
                                    <small class="display-block">We are almost done now</small>
                            </h6>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="display-block">Applicant resume:</label>
                                        <input type="file" name="resume" class="file-styled">
                                        <span class="help-block">Accepted formats: pdf, doc. Max file size 2Mb</span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Where did you find us?</label>
                                        <select name="source" data-placeholder="Choose an option..." class="select-simple">
                                            <option></option>
                                            <option value="monster">Monster.com</option>
                                            <option value="linkedin">LinkedIn</option>
                                            <option value="google">Google</option>
                                            <option value="adwords">Google AdWords</option>
                                            <option value="other">Other source</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Availability:</label>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="availability" class="styled">
                                                Immediately
                                            </label>
                                        </div>

                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="availability" class="styled">
                                                1 - 2 weeks
                                            </label>
                                        </div>

                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="availability" class="styled">
                                                3 - 4 weeks
                                            </label>
                                        </div>

                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="availability" class="styled">
                                                More than 1 month
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Additional information:</label>
                                        <textarea name="additional-info" rows="5" cols="5" placeholder="If you want to add any info, do it here." class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-wizard-actions">
                            <button class="btn btn-default" id="basic-back" type="reset">Back</button>
                            <button class="btn btn-info" id="basic-next" type="submit">Next</button>
                        </div>
                    </form>
                </div>
                <!-- /basic setup -->              

            </div>
            <!-- /content area -->

        </div>
        <!-- /main content -->

    </div>
    <!-- /page content -->

</div>
<!-- /page container -->
