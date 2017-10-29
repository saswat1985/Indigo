$(document).ready(function () {
    var selectedItems = "";
    FillCheckBoxList();
    FillUsersDdl();
    $(document).on("click", "#chkLstRoles > li .checkboxRole", function () {
        if (this.checked) {
            selectedItems += this.id + ",";
        }
        else {
            selectedItems = selectedItems.replace(this.id + ",", '');
        }
    });

    $('#btnSave').click(function () {
        var ddlUsers = $("#ddlUsers option:selected").val();        
        selectedItems = '';
        $("#chkLstRoles > li .checkboxRole").each(function () {
            if (this.checked) {
                selectedItems += this.id + ",";
            }
        })
            SaveData(ddlUsers, selectedItems);
        
    });

    $(document).on("change", "#ddlUsers", function () {

        $.ajax({
            type: "POST",
            url: "UserRoleMapper.aspx/GetSelectedRoles",
            contentType: "application/json; charset=utf-8",
            data: "{'userId':'" + $("#ddlUsers option:selected").val() + "'}",
            dataType: "json",
            success: function (data) {
                $("#chkLstRoles > li .checkboxRole").each(function () {
                    this.checked = false;
                });
                if (data.d != null) {
                    for (var i = 0; i < data.d.length; i++) {
                        $('#' + data.d[i])[0].checked = true;
                    }
                }
                console.log(data);
            },
            error: function (e) {
                console.log(e);
            },
            beforeSend: function () {
                showHideLoader(true);
            },
            complete: function () {
                showHideLoader(false);
            }

        });
    });
});

SaveData = function (userId, selectedItems) {
    $.ajax({
        type: "POST",
        url: "UserRoleMapper.aspx/SaveUserRoleMapping",
        contentType: "application/json; charset=utf-8",
        data: "{'userId': '" + userId + "', 'selectedItems': '" + selectedItems+"'}",
        dataType: "json",
        success: function (data) { },
        error: AjaxFailed,
        beforeSend: function () {
            showHideLoader(true);
        },
        complete: function () {
            showHideLoader(false);
        }
    });
}

FillUsersDdl = function () {
    $.ajax({
        type: "POST",
        url: "UserRoleMapper.aspx/GetUsersBasicDetailList",
        contentType: "application/json; charset=utf-8",
        data: "{}",
        dataType: "json",
        success: function (data) {
            if (data.d != null) {
                $('#ddlUsers').empty();
                $('#ddlUsers').append($("<option     />").val('0').text('--Please Select--'));
                $.each(data.d, function () {
                    $("#ddlUsers").append($("<option     />").val(this["UserId"]).text(this["UserCode"]));
                });
            }
        },
        error: AjaxFailed
    });
}

FillCheckBoxList = function () {
    $.ajax({
        type: "POST",
        url: "UserRoleMapper.aspx/GetUserRoleList",
        contentType: "application/json; charset=utf-8",
        data: "{}",
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
    $('#dvRoles').empty();
    LoadChkList(data);
}

LoadChkList = function (data) {

    var item = "<ul id='chkLstRoles'>"
    for (var i = 0; i < data.d.length; i++) {
        item += "<li><input type='checkbox' id='" + data.d[i]["RoleId"] + "' class='checkboxRole' /><span>" + data.d[i]["RoleName"] + "</span></li>";
    }
    item += "</ul>";
    $('#dvRoles').append(item);

}

AjaxFailed = function (e) {
    console.log(e);
}



ResetControls = function () {
     
}

