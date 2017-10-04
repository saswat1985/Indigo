var Id = 0;
$(document).ready(function () {
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

UserProfile = function () {
    $.ajax({
        type: "POST",
        url: "UsersListPage.aspx/GetEditRecord",
        contentType: "application/json; charset=utf-8",
        data: "{'userId':'" + 0 + "', 'isLoggedInUser':" + true + "}",
        dataType: "json",
        success: FillEditControls,
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

function clickNext(flag) {
    if (flag == 'schedule') {
        $("#schedule").show();
        $("#settings").hide();
        $("#activity").hide();

    }
    else if (flag == 'settings') {
        $("#schedule").hide();
        $("#settings").show();
        $("#activity").hide();
    } else {
        $("#schedule").hide();
        $("#settings").hide();
        $("#activity").show();
    }
}