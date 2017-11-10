$(document).ready(function () {
    $('#btnSave').click(function () {
        var txtEmail = $('#txtEmail').val();

        if (txtEmail === '') {
            alert('Enter email address');
            return;
        }
        else if (!validateEmail(txtEmail)) {
            alert("Enter valid email address");
            return;
        }

        if (txtEmail != '') {
            SaveData(txtEmail);
            ResetForm();
        }
    });
});

validateEmail = function (email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "ForgetPassword.aspx/ForgotPassword",
        contentType: "application/json; charset=utf-8",
        data: "{'email':'" + masterData + "'}",
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed,
        beforeSend: function () {
            showHideLoader(true);
        },
        complete: function () {
            showHideLoader(false);
        }
    });
}

AjaxSucessed = function (data) {
    if (data.d) {
        alert("Password has been sent to your email address.");
    }
    else {
        alert("Email address not found");
    }
}

AjaxFailed = function (e) {
    console.log(e);
}

ResetForm = function () {
    $('#txtEmail').val('');
}
