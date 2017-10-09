$(document).ready(function () {    
   /// GetUserDetails();
});

GetUserDetails = function () {
    $.ajax({
        type: "POST",
        url: "PaymentGetway.aspx/GetUserDetail",
        contentType: "application/json; charset=utf-8",
        data: "{}",      
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed
    });
}
AjaxSucessed = function (data) {
    console.log(data.d);    
}
AjaxFailed = function (error) {
    console.log(error);
}