$(document).ready(function () {
    FillGridView();
    $('#btnSave').click(function () {

        var txtMenuText = $('#txtMenuText').val();
        var txtMenuDescription = $('#txtMenuDescription').val();
        var txtNavigateUrl = $('#txtNavigateUrl').val();
        var ddlParentMenu = $("#ddlParentMenu option:selected").val();
        var hidMenuId = $('#hidMenuId').val();
        var txtMenuOrder = $('#txtMenuOrder').val();
        var ddlIsActive = $("#ddlIsActive option:selected").val();
        var Menu = {
            MenuId: 0,
            MenuText: txtMenuText,
            MenuDesc: txtMenuDescription,
            NavigateURL: txtNavigateUrl,
            ParentID: ddlParentMenu,
            OrderNo: txtMenuOrder,
            IsActive: ((ddlIsActive == 0) ? false : true)
        }
        SaveData(Menu);

    });

});

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "MenuMaster.aspx/SaveMenu",
        contentType: "application/json; charset=utf-8",
        data: "{'objMstMenuMaster':" + JSON.stringify(masterData) + "}",
        dataType: "json",
        success: FillGridView,
        error: AjaxFailed,
        beforeSend: function () {
            showHideLoader(true);
        },
        complete: function () {
            showHideLoader(false);
        }
    });
}


FillGridView = function () {
    $.ajax({
        type: "POST",
        url: "MenuMaster.aspx/GetMenuList",
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

FillParentMenuDdl = function (data) {
    if (data.d != null) {
        $("#ddlParentMenu").empty();
        $("#ddlParentMenu").append($("<option/>").val('0').text('--Please Select--'));
        $.each(data.d, function () {
            $("#ddlParentMenu").append($("<option     />").val(this["MenuId"]).text(this["MenuText"]));
        });
    }

}

AjaxSucessed = function (data) {
    $('#dvGrid').empty();

    ResetControls();
    LoadGrid(data);
    FillParentMenuDdl(data);
    $("#tblMenu").DataTable({
        "pageLength": 10,
        "ordering": true
    });
}

LoadGrid = function (data) {
    var item = "<table id='tblMenu' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Description</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Parent Menu</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["MenuText"] + "</td>";
        item += "<td>" + data.d[i]["MenuDesc"] + "</td>";
        item += "<td>" + data.d[i]["ParentMenu"] + "</td>";
        item += "<td class='text-center'><a href='#' data-toggle='modal' data-target='#modal_form_vertical'><i class='icon-pencil'></i></a></td>";
        item += "</tr>";
    }
    item += "</tbody></table>";

    $('#dvGrid').append(item);

}
AjaxFailed = function (e) {
    console.log(e);
}


ResetControls = function () {
    $('#txtMenuText').val('');
    $('#txtMenuDescription').val('');
    $('#txtNavigateUrl').val();
    $("#ddlParentMenu option:selected").val('0');
    $('#hidMenuId').val('0');
    $('#txtMenuOrder').val('');
    $("#ddlIsActive option:selected").val('0');
}


