
var CID = 0;
$(document).ready(function () {
    FillGridView();


    $('#btnSave').click(function () {

        var countryName = $('#txtCountryName').val();
        var countryPhoneCode = $('#txtCountryPhoneCode').val();
        //Console.log(countryName);       
        if (countryName != '' && countryPhoneCode!='') {
            var data = new Country(countryName, countryPhoneCode);
            SaveData(data);
            ResetForm();
        }        
    });// end save functioanlity

    $('#lnkNew').click(function () {
        ShowHideModel('true');
        $('#headingTitle').empty().append('Add Country');
    });
    // start edit
    $(document).on('click', '.edit', function () {       
        ShowHideModel('true');
        $('#headingTitle').empty().append('Edit Country');
        Id = $(this).closest('tr').find('input[type="hidden"]').val();        
        $.ajax({
            type: "POST",
            url: "CountryMaster.aspx/GetEditRecord",
            contentType: "application/json; charset=utf-8",
            data: "{CountryId:" + Id + "}",
            dataType: "json",
            success: FillEditControls,
            error: AjaxFailed,
            beforeSend: function () {
                showHideLoader(true);
            },
            complete: function () {
                showHideLoader(false);
            }
        });
    });// end Edit    

});

FillEditControls = function (data) {
    //console.log('hi')
   console.log(data.d);
    if (data.d != null) {
        ResetForm();
        $('#txtCountryPhoneCode').val(data.d["CountryPhoneCode"]);
        $('#txtCountryName').val(data.d["CountryName"]);
    }
}


SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "CountryMaster.aspx/SaveCountry",
        contentType: "application/json; charset=utf-8",
        data: "{'objCountryMaster':" + JSON.stringify(masterData) + ",'CID':'" + CID + "'}",
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
        url: "CountryMaster.aspx/GetCountryList",
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
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>Counrty Phone Code</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Country Name</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["CountryPhoneCode"] + "</td>";
        item += "<td>" + data.d[i]["CountryName"] + "</td>";        
        item += "<td class='text-center'><a href='#' id='edit-" + data.d[i]["CountryId"] + "' class='edit'><i class='icon-pencil'></i></a><input type='hidden' value='" + data.d[i]["CountryId"] + "' /></td>";
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
    $('#txtCountryPhoneCode').val('');
}

Country = function (countryName,CountryPhoneCode) {
    this.CountryName = countryName;
    this.CountryPhoneCode = CountryPhoneCode;
}
ShowHideModel = function (flag) {
    $('#modal_form_vertical').modal({
        show: flag
    });
};