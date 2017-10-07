﻿var Id = 0;
var userImage = "";
$(document).ready(function () {
    UserProfile();
    FillDropDown('ddlCountry', 'GetCountires', null, 'CountryId', 'CountryName', 0);
    FillDropDown('ddlBank', 'GetBanks', null, 'Id', 'BankName', 0);
    ResetForm();
    $(document).on('change', '#ddlCountry', function () {
        var countryId = $('#' + this.id + ' option:selected').val();
        FillDropDown('ddlState', 'GetStates', '{"countryId":"' + countryId + '"}', 'StateId', 'StateName', 0);
    });

    $(document).on('change', '#ddlState', function () {
        var stateId = $('#' + this.id + ' option:selected').val();
        FillDropDown('ddlCity', 'GetCities', '{"stateId":"' + stateId + '"}', 'CityId', 'CityName', 0);
    });


    $('#btnSave').click(function () {
        var UserProfileData = {
            'UserId': Id,
            //'UserCode': $('#txtUserCode').val(),
            'UserPhoto':userImage,
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
        success: function (data) {alert("Profile saved successfully.") },
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
        Id = data.d['UserId'];
        FillDropDown('ddlCountry', 'GetCountires', null, 'CountryId', 'CountryName', data.d['CountryId']);
        FillDropDown('ddlState', 'GetStates', '{"countryId":"' + data.d['CountryId'] + '"}', 'StateId', 'StateName', data.d['StateId']);
        FillDropDown('ddlCity', 'GetCities', '{"stateId":"' + data.d['StateId'] + '"}', 'CityId', 'CityName', data.d['CityId']);
        FillDropDown('ddlBank', 'GetBanks', null, 'Id', 'BankName', data.d['BankId']);
        $('#txtFirstName').val(data.d['FirstName']);
        $('#txtLastName').val(data.d['LastName']);
        $('#txtAddressLine1').val(data.d['AddressLine1']);
        $('#txtAddressLine2').val(data.d['AddressLine2']);
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

        $('#imgUserPhoto').attr('src', data.d['UserPhoto']);
        $('#hUserName').empty().append(capitalize(data.d['FirstName']) + ' ' + capitalize(data.d['LastName']));
    }
}

capitalize=function(string) {
    return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
}

AddNewProfile = function () {
    $('#dvGrid').hide();
    $('#dvDetails').show();
}

FillDropDown = function (ddl, method, data, key, value, selectedValue) {
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
                if (selectedValue > 0) {
                    $('#' + ddl).val(selectedValue);
                }
            }
        },
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
    // $('#txtUserCode').val('');
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
    $('#imgUserPhoto').attr('src', '');
    $('#hUserName').empty();
}

ShowHideModel = function (flag) {
    $('#modal_form_vertical').modal({
        show: flag
    });
};

UploadImage = function (input) {
    if (input.files && input.files[0]) {
        var imageDir = new FileReader();
        imageDir.onload = function (e) {
            $('#imgUserPhoto').attr('src', e.target.result);
            userImage = e.target.result;
        }
        imageDir.readAsDataURL(input.files[0]);
    }  
}