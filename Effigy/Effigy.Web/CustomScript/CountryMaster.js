$(document).ready(function () {
    FillGridView();


    $('#btnSave').click(function () {

        var countryName = $('#txtCountryName').val();
        //Console.log(countryName);       
        if (countryName != '') {
            var data = new Country(countryName);
            SaveData(data);
            ResetForm();
        }




    });

});

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "CountryMaster.aspx/SaveCountry",
        contentType: "application/json; charset=utf-8",
        data: "{'objCountryMaster':" + JSON.stringify(masterData) + "}",
        dataType: "json",
        success: FillGridView,
        error: AjaxFailed
    });
}

FillGridView = function () {
    $.ajax({
        type: "POST",
        url: "CountryMaster.aspx/GetCountryList",
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
    $("#tblCountry").DataTable({
        "pageLength": 10,
        "ordering": true
    });
}

LoadGrid = function (data) {
    var item = "<table id='tblCountry' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Country Name</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
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
    $('#txtCountryName').val('');
}

Country = function (countryName) {
    this.CountryName = countryName;

}