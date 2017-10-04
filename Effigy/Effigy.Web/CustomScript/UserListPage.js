var Id = 0;
$(document).ready(function () {
    FillGridView();
    FillDropDown('ddlCountry', 'GetCountires', null, 'CountryId', 'CountryName');
    FillDropDown('ddlBank', 'GetBanks', null, 'Id', 'BankName');
    ResetForm();
    $(document).on('change', '#ddlCountry', function () {
        var countryId = $('#' + this.id + ' option:selected').val();
        FillDropDown('ddlState', 'GetStates', '{"countryId":"' + countryId + '"}', 'StateId', 'StateName');
    });

    $(document).on('change', '#ddlState', function () {
        var stateId = $('#' + this.id + ' option:selected').val();
        FillDropDown('ddlCity', 'GetCities', '{"stateId":"' + stateId + '"}', 'CityId', 'CityName');
    });

    $(document).on('click', '.edit', function () {
        ResetForm();
        $('#dvGrid').hide();
        $('#dvDetails').show();
        Id = $(this).closest('tr').find('input[type="hidden"]').val();
        $.ajax({
            type: "POST",
            url: "UsersListPage.aspx/GetEditRecord",
            contentType: "application/json; charset=utf-8",
            data: "{'userId':'" + Id + "', 'isLoggedInUser':" + true + "}",
            dataType: "json",
            success: FillEditControls,
            error: AjaxFailed
        });
    });
    $('#btnSave').click(function () {
        var UserProfileData = {
            'UserId': Id,
            'UserCode': $('#txtUserCode').val(),
            'FirstName': $('#txtFirstName').val(),
            'LastName': $('#txtLastName').val(),
            'AddressLine1': $('#txtAddressLine1').val(),
            'AddressLine2': $('#txtAddressLine2').val(),
            'CityId': $('#ddlCity option:selected').val(),
            'StateId': $('#ddlState option:selected').val(),
            'ZipCode': $('#txtZipCode').val(),
            'EmailId': $('#txtEmail').val(),
            'CountryId': $('#ddlCountry option:selected').val(),
            'Phone': $('#txtPhone').val(),
            'BankId': $('#ddlBank option:selected').val(),
            'BranchName': $('#txtBranchName').val(),
            'IFSCCode': $('#txtIFSCCode').val(),
            'BranchAddress': $('#txtBranchAddress').val(),
            'ACHolderName': $('#txtACHolderName').val(),
            'ACNo': $('#txtAccountNo').val()
        };

        SaveData(UserProfileData);
    });
});

SaveData = function (objData) {
    $.ajax({
        type: "POST",
        url: "UsersListPage.aspx/SaveProfile",
        contentType: "application/json; charset=utf-8",
        data: "{'objData':" + JSON.stringify(objData) + "}",
        dataType: "json",
        success: function (data) { },
        error: AjaxFailed
    });
}

FillEditControls = function (data) {
    if (data.d != null) {
        ResetForm();
        //Id = Id;
            $('#txtUserCode').val(data.d['UserCode']);
            $('#txtFirstName').val(data.d['FirstName']);
            $('#txtLastName').val(data.d['LastName']);
            $('#txtAddressLine1').val(data.d['AddressLine1']);
            $('#txtAddressLine2').val(data.d['AddressLine2']);
            $('#ddlCity option:selected').val(data.d['CityId']);
            $('#ddlState option:selected').val(data.d['StateId']);
            $('#txtZipCode').val(data.d['ZipCode']);
            $('#txtEmail').val(data.d['EmailId']);
            $('#ddlCountry option:selected').val(data.d['CountryId']);
            $('#txtPhone').val(data.d['Phone']);
            $('#ddlBank option:selected').val(data.d['BankId']);
            $('#txtBranchName').val(data.d['BranchName']);
            $('#txtIFSCCode').val(data.d['IFSCCode']);
            $('#txtBranchAddress').val(data.d['BranchAddress']);
            $('#txtACHolderName').val(data.d['ACHolderName']);
            $('#txtAccountNo').val(data.d['ACNo']);
    }
}

AddNewProfile = function () {
    $('#dvGrid').hide();
    $('#dvDetails').show();
}

FillDropDown = function (ddl, method, data, key, value) {
    $.ajax({
        type: "POST",
        url: "UsersListPage.aspx/" + method,
        contentType: "application/json; charset=utf-8",
        data: (data != null ? data : "{}"),
        dataType: "json",
        success: function (data) {
            $('#' + ddl).empty().append($("<option     />").val('0').text('--Please Select--'));
            if (data.d != null) {
                $.each(data.d, function () {
                    $("#" + ddl).append($("<option     />").val(this[key]).text(this[value]));
                });
            }
        },
        error: AjaxFailed
    });
}

FillGridView = function () {
    $.ajax({
        type: "POST",
        url: "UsersListPage.aspx/GetUserList",
        contentType: "application/json; charset=utf-8",
        data: "{}",
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed
    });

}
AjaxSucessed = function (data) {
    $('#dvGrid').empty();
    $('#dvGrid').show();
    $('#dvDetails').hide();
    LoadGrid(data);
    $("#tblUsers").DataTable({
        "pageLength": 10,
        "ordering": true
    });
}

LoadGrid = function (data) {
    var item = "<table id='tblUsers' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>User Code</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Phone</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Email</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["UserCode"] + "</td>";
        item += "<td>" + data.d[i]["FirstName"] + " " + data.d[i]["LastName"] + "</td>";
        item += "<td>" + data.d[i]["ContactNo"] + "</td>";
        item += "<td>" + data.d[i]["EmailId"] + "</td>";
        item += "<td class='text-center'><a href='#' id='edit-" + data.d[i]["UserId"] + "' class='edit'><i class='icon-pencil'></i></a><input type='hidden' value='" + data.d[i]["UserId"] + "' /></td>";
        item += "</tr>";
    }
    item += "</tbody></table>";
    $('#dvGrid').append(item);
}

AjaxFailed = function (e) {
    console.log(e);
}

ResetForm = function () {
    $('#txtUserCode').val('');
    $('#txtFirstName').val('');
    $('#txtLastName').val('');
    $('#txtAddressLine1').val('');
    $('#txtAddressLine2').val('');
    $('#txtCity').val();
    $('#ddlState option:selected').val(0);
    $('#txtZipCode').val('');
    $('#txtEmail').val('');
    $('#ddlCountry option:selected').val(0);
    $('#txtPhone').val('');
    $('#ddlBank option:selected').val(0);
    $('#txtBranchName').val('');
    $('#txtIFSCCode').val('');
    $('#txtBranchAddress').val('');
    $('#txtACHolderName').val('');
    $('#txtAccountNo').val('');
}

ShowHideModel = function (flag) {
    $('#modal_form_vertical').modal({
        show: flag
    });
};