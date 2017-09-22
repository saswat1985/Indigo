$(document).ready(function () {
    FillGridView();
    $('#btnSave').click(function () {

        var txtRoleName = $('#txtRoleName').val();
        var txtDescription = $('#txtDescription').val();
        var hidMenuId = $('#hidRoleId').val();
        var ddlIsActive = $("#ddlIsActive option:selected").val();
        var Role = {
            RoleId: 0,
            RoleName: txtRoleName,
            Description: txtDescription,
            IsActive: ((ddlIsActive == 0) ? false : true)
        }
        SaveData(Role);
        
    });

});

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "UserRoleMaster.aspx/SaveUserRole",
        contentType: "application/json; charset=utf-8",
        data: "{'objUserRoleMaster':" + JSON.stringify(masterData) + "}",
        dataType: "json",
        success: FillGridView,
        error: AjaxFailed
    });
}


FillGridView = function () {
    $.ajax({
        type: "POST",
        url: "UserRoleMaster.aspx/GetUserRoleList",
        contentType: "application/json; charset=utf-8",
        data: "{}",
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed
    });

}


AjaxSucessed = function (data) {
    $('#dvGrid').empty();

    
    LoadGrid(data);
    $("#tblUserRole").DataTable({
        "pageLength": 10,
        "ordering": true
    });
}

LoadGrid = function (data) {
    console.log(data);
    var item = "<table id='tblUserRole' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Description</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["RoleName"] + "</td>";
        item += "<td>" + data.d[i]["Description"] + "</td>";
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
     $('#txtRoleName').val('');
     $('#txtDescription').val('');
     $('#hidRoleId').val('0');
     $("#ddlIsActive option:selected").val('0');
}

