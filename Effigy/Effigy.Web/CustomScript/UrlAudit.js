var masterData = {};
$(document).ready(function () {
    GetMasterData();
    $('#btnSave').click(function () {
        saveObj = {
            UniqueURL: $("#txtWebSiteName").val(),
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
        if (ddlWebSiteStatus === "2" || ddlWebSiteStatus === "3" || ddlWebSiteStatus === "5") {
            FillDropDown('ddlIsCountry', masterData.BooleanDropDownData, 'Key', 'Value', "false", "Country", "-1");
            FillDropDown('ddlIsAddress', masterData.BooleanDropDownData, 'Key', 'Value', "false", "Address", "-1");
            FillDropDown('ddlIsCity', masterData.BooleanDropDownData, 'Key', 'Value', "false", "City", "-1");
            FillDropDown('ddlIsState', masterData.BooleanDropDownData, 'Key', 'Value', "false", "State", "-1");
            FillDropDown('ddlIsCompanyProfile', masterData.BooleanDropDownData, 'Key', 'Value', "false", "Company Profile", "-1");
            FillDropDown('ddlNameProduct', masterData.ProductCountList, 'Key', 'Value', "0", "Name of Product", "-1");
            FillDropDown('ddlImageProduct', masterData.ProductCountList, 'Key', 'Value', "0", "Image of Product", "-1");
            FillDropDown('ddlDescProduct', masterData.ProductCountList, 'Key', 'Value', "0", "Desc of Product", "-1");
        }
        else
        {
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
    });
});



IntilizeData = function (randomUrlFlag) {
    if (masterData != null) {
        RandomURL(randomUrlFlag);
        $("txtEmail").val("");
        $("txtPhone").val("");

        FillDropDown('ddlWebSiteStatus', masterData.WebSiteStatusList, 'Id','WebSiteStatus', -1, "WebSite status", "-1");
        FillDropDown('ddlBusinessType', masterData.BusinessTypeList, 'Id','BusinessType', -1, "Kind of Business", "-1");

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
            IntilizeData();
            RandomURL(false);
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
    else
    {
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
