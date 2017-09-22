$(document).ready(function () {
    $('#btnSave').on("click", function () {
        ChangePassword();
    });
});

ChangePassword = function () {
    var txtPassword = $('#txtPassword').val()
    var txtConfirmPassword = $('#txtConfirmPassword').val();
    if (txtPassword !== txtConfirmPassword) {
        alert('Password and repeat password are mismatched');
        return false
    }
    $.ajax({
        type: "POST",
        url: "ChangePassword.aspx/SavePassword",
        contentType: "application/json; charset=utf-8",
        data: "{'password':'" + txtPassword +"'}",
        dataType: "json",
        success: function (data) {
            alert('Password changed successfully');
        },
        error: function (e) {
            console.log(e);
        }

    });
}





