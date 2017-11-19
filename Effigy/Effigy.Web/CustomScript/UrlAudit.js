var masterData = {};
$(document).ready(function () {
    GetMasterData();
    $('#btnSave').click(function () {
        saveObj = {
            UniqueURL: $("#txtWebSiteName").val(),
            URLStatus: $("#ddlWebSiteStatus option:selected").val(),
            IsAddressExist: $("#ddlIsAddress option:selected").val(),
            IsCityExist: $("#ddlIsCity option:selected").val(),
            BusinessType: $("#ddlBusinessType option:selected").val(),
            IsStateExist: $("#ddlIsState option:selected").val(),
            IsCountryExist: $("#ddlIsCountry option:selected").val(),
            IsProfileExist: $("#ddlIsCompanyProfile option:selected").val(),
            ProductCount: $("#ddlNameProduct option:selected").val(),
            ProductImageCount: $("#ddlImageProduct option:selected").val(),
            ProductDescCount: $("#ddlDescProduct option:selected").val(),
            Email: $("#txtEmail").val(),
            PhoneNo: $("#txtPhone").val(),
            Comment: $("#txtComment").val()
        }

        if (saveObj.URLStatus === "-1") {
            alert('Please select wesite status.');
            return false;
        }

        if (saveObj.IsAddressExist === "-1") {
            alert('Please select address exist.');
            return false;
        }

        if (saveObj.IsCityExist === "-1") {
            alert('Please select city exist.');
            return false;
        }

        if (saveObj.BusinessType === "-1") {
            alert('Please select business type.');
            return false;
        }


        if (saveObj.Email!=='' && !validateEmail(saveObj.Email)) {
            alert('Please provide a valid email.');
            return false;
        }

        if (saveObj.PhoneNo!=='' && !saveObj.PhoneNo.match('^[0-9]{3,16}$')) {
            alert('Please provide a valid phone no.');
            return false;
        }

        if (saveObj.IsCountryExist === "-1") {
            alert('Please select country exist.');
            return false;
        }

        if (saveObj.IsStateExist === "-1") {
            alert('Please select state exist.');
            return false;
        }
        if (saveObj.IsProfileExist === "-1") {
            alert('Please select company profile exist.');
            return false;
        }

        if (saveObj.ProductCount === "-1") {
            alert('Please select product count.');
            return false;
        }

        if (saveObj.ProductImageCount === "-1") {
            alert('Please select product image count.');
            return false;
        }

        if (saveObj.ProductDescCount === "-1") {
            alert('Please select product description count.');
            return false;
        }

        $.ajax({
            type: "POST",
            url: "URLAudit.aspx/Save",
            contentType: "application/json; charset=utf-8",
            data: "{'obj':" + JSON.stringify(saveObj) + "}",
            dataType: "json",
            success: function (data) {
                
                IntilizeData(true);
                alert("Submitted Url successfully.");
            },
            error: AjaxFailed,
            beforeSend: function () {
                showHideLoader(true);
            },
            complete: function () {
                showHideLoader(false);
            }
        });
    });

    $('#btnReset').click(function () {
    });

    $(document).on('change', "#ddlWebSiteStatus", function (e) {
        var ddlWebSiteStatus = $('#' + this.id + ' option:selected').val();
        var objWebStatus = {};
        $.each(masterData.WebSiteStatusList, function (i, obj) {
            if (obj.Id === parseInt(ddlWebSiteStatus)) {
                objWebStatus = obj;
            }
        });

        if (ddlWebSiteStatus!=="-1" && !objWebStatus.IsValidationRequired) {
            FillDropDown('ddlIsCountry', masterData.BooleanDropDownData, 'Key', 'Value', "false", "Country", "-1");
            FillDropDown('ddlIsAddress', masterData.BooleanDropDownData, 'Key', 'Value', "false", "Address", "-1");
            FillDropDown('ddlIsCity', masterData.BooleanDropDownData, 'Key', 'Value', "false", "City", "-1");
            FillDropDown('ddlIsState', masterData.BooleanDropDownData, 'Key', 'Value', "false", "State", "-1");
            FillDropDown('ddlIsCompanyProfile', masterData.BooleanDropDownData, 'Key', 'Value', "false", "Company Profile", "-1");
            FillDropDown('ddlNameProduct', masterData.ProductCountList, 'Key', 'Value', "0", "Name of Product", "-1");
            FillDropDown('ddlImageProduct', masterData.ProductCountList, 'Key', 'Value', "0", "Image of Product", "-1");
            FillDropDown('ddlDescProduct', masterData.ProductCountList, 'Key', 'Value', "0", "Desc of Product", "-1");
        }
        else {
            FillDropDown('ddlBusinessType', masterData.BusinessTypeList, 'Id', 'BusinessType', -1, "Kind of Business", "-1");

            FillDropDown('ddlIsCountry', masterData.BooleanDropDownData, 'Key', 'Value', -1, "Country", "-1");
            FillDropDown('ddlIsAddress', masterData.BooleanDropDownData, 'Key', 'Value', -1, "Address", "-1");
            FillDropDown('ddlIsCity', masterData.BooleanDropDownData, 'Key', 'Value', -1, "City", "-1");
            FillDropDown('ddlIsState', masterData.BooleanDropDownData, 'Key', 'Value', -1, "State", "-1");
            FillDropDown('ddlIsCompanyProfile', masterData.BooleanDropDownData, 'Key', 'Value', -1, "Company Profile", "-1");
            FillDropDown('ddlNameProduct', masterData.ProductCountList, 'Key', 'Value', -1, "Name of Product", "-1");
            FillDropDown('ddlImageProduct', masterData.ProductCountList, 'Key', 'Value', -1, "Image of Product", "-1");
            FillDropDown('ddlDescProduct', masterData.ProductCountList, 'Key', 'Value', -1, "Desc of Product", "-1");
        }

        $("#txtEmail").val('');
        $("#txtPhone").val('');
        $("#txtComment").val('');
    });
});


validateEmail = function (email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);

}

IntilizeData = function (randomUrlFlag) {
   
    if (masterData != null) {
        RandomURL(randomUrlFlag);
        $("#txtEmail").val('');
        $("#txtPhone").val('');
        $("#txtComment").val('');

        FillDropDown('ddlWebSiteStatus', masterData.WebSiteStatusList, 'Id', 'WebSiteStatus', -1, "WebSite status", "-1");
        FillDropDown('ddlBusinessType', masterData.BusinessTypeList, 'Id', 'BusinessType', -1, "Kind of Business", "-1");

        FillDropDown('ddlIsCountry', masterData.BooleanDropDownData, 'Key', 'Value', -1, "Country", "-1");
        FillDropDown('ddlIsAddress', masterData.BooleanDropDownData, 'Key', 'Value', -1, "Address", "-1");
        FillDropDown('ddlIsCity', masterData.BooleanDropDownData, 'Key', 'Value', -1, "City", "-1");
        FillDropDown('ddlIsState', masterData.BooleanDropDownData, 'Key', 'Value', -1, "State", "-1");
        FillDropDown('ddlIsCompanyProfile', masterData.BooleanDropDownData, 'Key', 'Value', -1, "Company Profile", "-1");
        FillDropDown('ddlNameProduct', masterData.ProductCountList, 'Key', 'Value', -1, "Name of Product", "-1");
        FillDropDown('ddlImageProduct', masterData.ProductCountList, 'Key', 'Value', -1, "Image of Product", "-1");
        FillDropDown('ddlDescProduct', masterData.ProductCountList, 'Key', 'Value', -1, "Desc of Product", "-1");

    }
}

GetMasterData = function () {

    $.ajax({
        type: "POST",
        url: "URLAudit.aspx/GetMastersData",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            masterData = data.d;
            IntilizeData(false);
            //RandomURL(false);
        },
        error: AjaxFailed,
        beforeSend: function () {
            showHideLoader(true);
        },
        complete: function () {
            showHideLoader(false);
        }
    });

}

RandomURL = function (flag) {
    if (flag) {
        $.ajax({
            type: "POST",
            url: "URLAudit.aspx/GetRandomUrl",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                masterData.UniqueURLRandom = data.d;
                $("#txtWebSiteName").val(masterData.UniqueURLRandom);
                $("#ctrIframe").attr('src', masterData.UniqueURLRandom);
                //IntilizeData();
            },
            error: AjaxFailed,
            beforeSend: function () {
                showHideLoader(true);
            },
            complete: function () {
                showHideLoader(false);
            }
        });
    }
    else {
        $("#txtWebSiteName").val(masterData.UniqueURLRandom);
        $("#ctrIframe").attr('src', masterData.UniqueURLRandom);

    }
}

FillDropDown = function (ddl, data, key, value, selectedValue, firstText, firstVal) {

    $('#' + ddl).empty().append($("<option     />").val(firstVal).text(firstText));
    if (data !== null) {
        $.each(data, function () {
            $("#" + ddl).append($("<option     />").val(this[key]).text(this[value]));
        });

        $('#' + ddl).val(selectedValue);

    }

}

AjaxSucessed = function (data) {
}

AjaxFailed = function (e) {
    console.log(e);
}

ResetForm = function () {

}
