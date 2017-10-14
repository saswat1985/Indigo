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
            resetForm();
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
    // var result = true;
    if (userData.FirstName === '') {
        alert('Please Enter First Name');
        return false;
    }
    else if (!userData.FirstName.match('^[a-zA-Z]{3,16}$')) {
        alert("Enter valid first name");
        return false;
    }

    if (userData.LastName === '') {
        alert('Please enter last Name');
        return false;
    }
    if (!userData.LastName.match('^[a-zA-Z]{3,16}$')) {
        alert("Enter valid last name");
        return false;
    }

    if (userData.ContactNo === '') {
        alert('Please Enter mobile no');
        return false;
    }
    if (CheckPhoneNo(userData.ContactNo)) {
        alert("In-valid/duplicate mobile no.");
        return false;
    }

    if (CheckEmailID(userData.EmailId)) {
        alert('Please provide a valid email address/Duplicate email id');
        return false;
    }
    if (userData.UserCategory === '0') {
        alert('Please select a work category');
        return false;
    }
    if (userData.RefrelCode !== '') {
        if (!CheckRefrealCode(userData.RefrelCode)) {
            alert('Invalid referral code');
            return false;
        }
    }
    if (!userData.AcceptTermCondition) {
        alert('Please Accept term and Condition');
        return false;
    }
    else {
        return true;
    }

}

CheckEmailID = function (emailId) {
    var result;
    if (!validateEmail(emailId)) {
        result = true;
    }
    else {
        $.ajax({
            type: "POST",
            url: "UserRegstration.aspx/IsDuplicateEmail",
            contentType: "application/json; charset=utf-8",
            data: "{emailId:'" + emailId + "'}",
            dataType: "json",
            async: false,
            success: function (data) {
                result = data.d;
            },
            error: AjaxFailed
        });
    }
    return result;
}

CheckPhoneNo = function (phoneno) {
    var result;
    if (!phoneno.match('^[0-9]{3,16}$')) {
        result = true;
    }
    else {
        $.ajax({
            type: "POST",
            url: "UserRegstration.aspx/IsDuplicateMobile",
            contentType: "application/json; charset=utf-8",
            data: "{mobileNo:'" + phoneno + "'}",
            dataType: "json",
            async: false,
            success: function (data) {
                result = data.d;
            },
            error: AjaxFailed
        });
    }
    return result;
}

CheckRefrealCode = function (refrealCode) {
    var result;
    $.ajax({
        type: "POST",
        url: "UserRegstration.aspx/CheckRefrealCode",
        contentType: "application/json; charset=utf-8",
        data: "{refrealCode:'" + refrealCode + "'}",
        dataType: "json",
        async: false,
        success: function (data) {
            result = data.d;
        },
        error: AjaxFailed
    });

    return result;
}

validateEmail = function (email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);

}

resetForm = function () {
    $('#txtFirstName').val('');
    $('#txtLastName').val('');
    $('#txtMobileNo').val('');
    $('#txtEmail').val('');   
    $('#txtRefrelCode').val('');

}