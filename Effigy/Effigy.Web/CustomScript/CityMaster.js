$(document).ready(function () {
    FillGridView();
    $('#btnSave').click(function () {
        //var countryid = $('#ddlCountry').val();
        //var Stateid = $('#ddlState').Val();
        //var CityName = $('#txtCity').Val();
        //var data = new City(countryid, Stateid, CityName);
        var City = {
            Countryid: $('#ddlCountry').val(),
            Stateid: $('#ddlState').val(),
            CityName: $('#txtCity').val()
        }
        SaveData(City);
        ResetForm();
    });
    $("#ddlCountry").change(function () {
        var Countryid = $('#ddlCountry').val();
        if (Countryid != '0') {
            FillCityDataByCountryId(Countryid);
        }

    });
});

FillCityDataByCountryId = function (countryId) {
    $.ajax({
        type: "POST",
        url: "CityMaster.aspx/GetStateByCountryId",
        contentType: "application/json; charset=utf-8",
        data: "{'countryId':" + countryId + "}",
        dataType: "json",
        success: AjaxDropDownSuccess,
        error: AjaxFailed,
        beforeSend: function () {
            showHideLoader(true);
        },
        complete: function () {
            showHideLoader(false);
        }
    });
}

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "CityMaster.aspx/SaveCity",
        contentType: "application/json; charset=utf-8",
        data: "{'objCityMaster':" + JSON.stringify(masterData) + "}",
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
        url: "CityMaster.aspx/GetCityList",
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
    $("#tblCountry").DataTable({
        "pageLength": 10,
        "ordering": true
    });
}

LoadGrid = function (data) {
    var item = "<table id='tblCountry' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>City Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>State Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Country Name</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["CityName"] + "</td>";
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
    $('#ddlState').val('0');
    $('#txtCity').val('');
}

AjaxDropDownSuccess = function (data) {
    if (data.d != null) {
        $("#ddlState").empty();
        $("#ddlState").append($("<option/>").val('0').text('--Please Select--'));
        $.each(data.d, function () {
            $("#ddlState").append($("<option     />").val(this["StateId"]).text(this["StateName"]));
        });
    }
}

