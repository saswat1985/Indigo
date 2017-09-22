$(document).ready(function () {
    GetMenusChkList();
    FillParentMenuDdl();
    var selectedItems = "";

    $(document).on("click", "#mainULList > li .checkboxMenuRole", function () {
        
        if (this.checked) {
            selectedItems += this.id + ",";
        }
        else{
            
            selectedItems = selectedItems.replace(this.id + ",", '');
        }
    });

    $('#btnSave').on("click", function () {
        selectedItems = '';
        $("#mainULList > li .checkboxMenuRole").each(function () {
            if (this.checked) {
                selectedItems += this.id + ",";
            }
        })
        var data = { 'roleId': $("#ddlUserRole option:selected").val(), 'selectedMenus': selectedItems}
        SaveData(data);
    });

    $(document).on("change", "#ddlUserRole",function () {
        
        $.ajax({
            type: "POST",
            url: "UserRoleMenuMapper.aspx/GetSelectedMenus",
            contentType: "application/json; charset=utf-8",
            data: "{'roleId':'" + $("#ddlUserRole option:selected").val() +"'}",
            dataType: "json",
            success: function (data) {

                $("#mainULList > li .checkboxMenuRole").each(function () {
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
            }

        });
    });

});

GetMenusChkList = function () {
    $.ajax({
        type: "POST",
        url: "UserRoleMenuMapper.aspx/GetMenuList",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (data.d!=null) {
                $('#divMenuRole').empty();
                var item = "<ul id='mainULList'>"
                for (var i = 0; i < data.d.length; i++) {
                    item += "<li><input type='checkbox' id='" + data.d[i]["MenuId"] + "' class='checkboxMenuRole' /><span>" + data.d[i]["MenuText"] + "</span></li>";
                }
                item += "</ul>";
                $('#divMenuRole').append(item);
            }
            console.log(data); },
        error: function (e) {
            console.log(e);
        }

    });
}

SaveData = function (masterData) {
    
    $.ajax({
        type: "POST",
        url: "UserRoleMenuMapper.aspx/SaveMenuRoleMapping",
        contentType: "application/json; charset=utf-8",
        data: "{'objMenuRoleMapper':" + JSON.stringify(masterData) + "}",
        dataType: "json",
        success: function () {
            alert('Mapping saved successfully');
        },
        error: function () { }
    });
}


FillParentMenuDdl = function (data) {
    $.ajax({
        type: "POST",
        url: "UserRoleMaster.aspx/GetUserRoleList",
        contentType: "application/json; charset=utf-8",
        data: "{}",
        dataType: "json",
        success: function (data) {
            if (data.d != null) {
                $('#ddlUserRole').empty();
                $('#ddlUserRole').append($("<option     />").val('0').text('--Please Select--'));
                $.each(data.d, function () {
                    $("#ddlUserRole").append($("<option     />").val(this["RoleId"]).text(this["RoleName"]));
                });
            }
        },
        error: function (e) { }
    });
    

}





