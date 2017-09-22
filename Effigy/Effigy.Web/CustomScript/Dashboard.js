﻿$(document).ready(function () {
    CheckPayment();
    $("#Close").hide();
});
CheckPayment = function () {
    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/CheckPayment",
        contentType: "application/json; charset=utf-8",
        data: "{}",
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed
    });
}

AjaxSucessed = function (data) {

    if (data.d.UserType == 2 && data.d.IsMemberShipTaken == false) {
        $('#modal_form_vertical').modal('show');
        if (parseInt(data.d.TimeRemaining) <= 24)
            $("#btnClose").show();
        else
            $("#btnClose").hide();
    }
    else {
    }



}

AjaxFailed = function (error) {
    console.log(error);
}