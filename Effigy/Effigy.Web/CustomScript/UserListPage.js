var Id = 0;
var userImage = "";
$(document).ready(function () {
    FillGridView();
    FillDropDown('ddlCountry', 'GetCountires', null, 'CountryId', 'CountryName',0);
    FillDropDown('ddlBank', 'GetBanks', null, 'Id', 'BankName',0);
    ResetForm();
    $(document).on('change', '#ddlCountry', function () {
        var countryId = $('#' + this.id + ' option:selected').val();
        FillDropDown('ddlState', 'GetStates', '{"countryId":"' + countryId + '"}', 'StateId', 'StateName',0);
    });

    $(document).on('change', '#ddlState', function () {
        var stateId = $('#' + this.id + ' option:selected').val();
        FillDropDown('ddlCity', 'GetCities', '{"stateId":"' + stateId + '"}', 'CityId', 'CityName',0);
    });
    $(document).on('click', '.delete', function () {
        Id = $(this).closest('tr').find('input[type="hidden"]').val();
        if (confirm("Are you sure to delete record?")) {
            $.ajax({
                type: "POST",
                url: "UsersListPage.aspx/DeleteRecord",
                contentType: "application/json; charset=utf-8",
                data: "{'userId':'" + Id + "'}",
                dataType: "json",
                success: function () {
                    FillGridView();
                    alert('Deleted successfully.');
                },
                error: AjaxFailed
            });
        }
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
            data: "{'userId':'" + Id + "', 'isLoggedInUser':" + false + "}",
            dataType: "json",
            success: FillEditControls,
            error: AjaxFailed
        });
    });
    $('#btnSave').click(function () {
       
        var UserProfileData = {
            UserId: Id,
            //'UserCode': $('#txtUserCode').val(),
            UserPhoto:userImage,
            FirstName: $('#txtFirstName').val(),
            LastName: $('#txtLastName').val(),
            AddressLine1: $('#txtAddressLine1').val(),
            AddressLine2: $('#txtAddressLine2').val(),
            CityId: $('#ddlCity option:selected').val(),
            StateId: $('#ddlState option:selected').val(),
            ZipCode: $('#txtZipCode').val(),
            EmailId: $('#txtEmail').val(),
            CountryId: $('#ddlCountry option:selected').val(),
            Phone: $('#txtPhone').val(),
            BankId: $('#ddlBank option:selected').val(),
            BranchName: $('#txtBranchName').val(),
            IFSCCode: $('#txtIFSCCode').val(),
            BranchAddress: $('#txtBranchAddress').val(),
            ACHolderName: $('#txtACHolderName').val(),
            ACNo: $('#txtAccountNo').val()
        };
        if (UserProfileData.FirstName == null || UserProfileData.FirstName=='') {
            alert('Enter first name');
            return;
        }
        else if (!UserProfileData.FirstName.match('^[a-zA-Z]{3,16}$')) {
            alert("Enter valid first name");
            return
        }

        if (UserProfileData.LastName == null || UserProfileData.LastName=='') {
            alert('Enter last name');
            return;
        }
        else if (!UserProfileData.LastName.match('^[a-zA-Z]{3,16}$')) {
            alert("Enter valid last name");
            return
        }

        if (UserProfileData.AddressLine1 == null || UserProfileData.AddressLine1 == '') {
            alert('Enter address line 1');
            return;
        }

        if (UserProfileData.CountryId == null || UserProfileData.CountryId == '0') {
            alert('Select country');
            return;
        }

        if (UserProfileData.StateId === null || UserProfileData.StateId === '0') {
            alert('Select state');
            return;
        }

        if (UserProfileData.CityId === null || UserProfileData.CityId === '0') {
            alert('Select city');
            return;
        }

        if (UserProfileData === null || UserProfileData.StateId === '0') {
            alert('Select state');
            return;
        }

        if (UserProfileData.EmailId === null || UserProfileData.EmailId === '') {
            alert('Enter email address');
            return;
        }
        else if (!validateEmail(UserProfileData.EmailId)) {
            alert("Enter valid email address");
            return;
        }

        SaveData(UserProfileData);
    });
});

validateEmail = function(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

SaveData = function (objData) {
    $.ajax({
        type: "POST",
        url: "UsersListPage.aspx/SaveProfile",
        contentType: "application/json; charset=utf-8",
        data: "{'objData':" + JSON.stringify(objData) + "}",
        dataType: "json",
        success: function (data) { FillGridView(); },
        error: AjaxFailed
    });
}

FillEditControls = function (data) {
    if (data.d != null) {
        ResetForm();
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
        item += "<td class='text-center'><a href='#' id='edit-" + data.d[i]["UserId"] + "' class='edit'><i class='icon-pencil'></i></a><input type='hidden' value='" + data.d[i]["UserId"] + "' /><a href='#' id='delete-" + data.d[i]["UserId"] + "' class='delete'><i class='icon-eraser'></i></a></td>";
        item += "</tr>";
    }
    item += "</tbody></table>";
    $('#dvGrid').append(item);
}

AjaxFailed = function (e) {
    console.log(e);
}

ResetForm = function () {
    //$('#txtUserCode').val('');
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