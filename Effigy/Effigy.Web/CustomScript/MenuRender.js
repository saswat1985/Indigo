$(document).ready(function () {
    GetMenus();
});

GetMenus = function () {
    $.ajax({
        type: "POST",
        url: "../LogOut.aspx/GetMenuRender",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#divMenu').empty();
            $('#divMenu').append(data.d);
            console.log(data); },
        error: function (e) {
            console.log(e);
        }

    });
}





