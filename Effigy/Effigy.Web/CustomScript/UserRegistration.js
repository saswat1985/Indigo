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
        if (PageValidate(UserData)) {
            SaveUserDetail(UserData);
        }

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
    if (data.d) {
        alert('User created sucessfully. User Id and Password send through SMS and email');
    }
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

PageValidate = function (userData) {
    debugger;
    // var result = true;
    if (userData.FirstName === '') {
        alert('Please Enter First Name');
        return false;
    }
    if (userData.LastName === '') {
        alert('Please Enter Last Name');
        return false;
    }
    if (userData.ContactNo === '') {
        alert('Please Enter mobile no');
        return false;
    }
    if (!validateEmail(userData.EmailId)) {
        alert('Please provide a valid email address');
        return false;
    }
    if (userData.UserCategory === '0') {
        alert('Please select a work category');
        return false;
    }

}


function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);

}