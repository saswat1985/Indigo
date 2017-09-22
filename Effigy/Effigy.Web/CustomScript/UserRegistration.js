$(document).ready(function () {

    $('#btnRegistartion').click(function () {
        var firstName = $('#txtFirstName').val();
        var lastName = $('#txtLastName').val();
        var mobileNo = $('#txtMobileNo').val();
        var email = $('#txtEmail').val();
        var category = $('#ddlCategory').val();
        var refrelCode = $('#txtRefrelCode').val();
        var acceptCondition = $('#chkAccept').is(':checked');

        var UserData = new User(firstName, lastName, mobileNo, email, category, refrelCode, acceptCondition);

        SaveUserDetail(UserData);
    });

});

SaveUserDetail = function (userData) {
    $.ajax({
        type: "POST",
        url: "UserRegstration.aspx/UserRegistration",
        contentType: "application/json; charset=utf-8",
        data: "{'objUserData':" + JSON.stringify(userData) + "}",
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed
    });

}

AjaxSucessed = function (data) {
    alert(data);
}

AjaxFailed = function (e) {
    console.log(e);
}
User = function (fName, lName, mobNo, email, cat, refrelCode, acceptCondition) {
    this.FirstName = fName;
    this.LastName = lName;
    this.ContactNo = mobNo;
    this.EmailId = email;
    this.UserCategory = cat;
    this.RefrelCode = refrelCode;
    this.AcceptTermCondition = acceptCondition;
}