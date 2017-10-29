$(document).ready(function () {
    FillGridView();
    // validation
    //$("#" + ids.lnkSave).click(function () {
    //    var countryName = $("#" + ids.ddlCountry).val();       
    //    if(countryName=='0')
    //        alert("Please Select Country.");
    //    var StateName = $("#" + ids.txtStateName).val();
    //    if(StateName=='')
    //        alert("Enter State Name.")
    //});
    $('#btnSave').click(function () {       
        var State = {
            Countryid: $('#ddlCountry').val(),            
            StateName: $('#txtStateName').val()
        }
        SaveData(State);
        ResetForm();
    });
});

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "StateMaster.aspx/SaveState",
        contentType: "application/json; charset=utf-8",
        data: "{'objStateMaster':" + JSON.stringify(masterData) + "}",
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
        url: "StateMaster.aspx/GetStateList",
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
    $('#dvGrid').empty();
    LoadGrid(data);
    $("#tblState").DataTable({
        "pageLength": 10,
        "ordering": true
    });

}

LoadGrid = function (data) {
    var item = "<table id='tblState' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>State Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Country Name</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["StateName"] + "</td>";
        item += "<td>" + data.d[i]["CountryName"] + "</td>";
        item += "<td class='text-center'><a href='#' data-toggle='modal' data-target='#modal_form_vertical'><i class='icon-pencil'></i></a></td>";
        item += "</tr>";
    }
    item += "</tbody></table>";
    $('#dvGrid').append(item);

}

AjaxFailed = function (e) {
    console.log(e);
}

ResetForm = function () {
    $('#ddlCountry').val('0');  
    $('#txtStateName').val('');
}