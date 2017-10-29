var excelJsonUrls = "";
$(document).ready(function () {
    $('#btnSave').click(function () {
        var urls = $('#txtUrl').val();
        SaveData(urls, 'manual');
    });

    $('#btnSaveExcel').click(function () {
        SaveData(excelJsonUrls.slice(0, (excelJsonUrls.length - 2)), 'excel');

    });

    $(document).on('change', "#excelfile", function (e) {
        $('#fileSpan').empty().append('<img src="../Images/Spinner.gif" />Please wait..');
        ProcessExcel();
    });


});

SaveData = function (masterData, type) {
    var arrUrls = {};
    if (masterData != '') {
        arrUrls = masterData.split('\n');
        var finalUrlsToProcess = new Array();
        for (var i = 0; i < arrUrls.length; i++) {
            if (arrUrls[i]) {
                finalUrlsToProcess.push(arrUrls[i]);
            }
        }

        $.ajax({
            type: "POST",
            url: "UrlEntry.aspx/ProcessRawUrls",
            contentType: "application/json; charset=utf-8",
            data: "{'rawUrls':" + JSON.stringify(finalUrlsToProcess) + "}",
            dataType: "json",
            success: function (data) { FillResultUrls(data, type); },
            error: AjaxFailed,
            beforeSend: function () {
                showHideLoader(true);
            },
            complete: function () {
                showHideLoader(false);
            }
        });
    }
}

FillResultUrls = function (data, type) {
    if (data != null) {
        var validCount = 0;
        var invalidCount = 0;
        $("#divResultExcel").empty();
        $("#divResult").empty();
        $.each(data.d, function () {
            obj = this;
            if (obj["urlStatus"] == 'G') {
                validCount += 1;
                if (type == 'excel') {
                    $("#divResultExcel").append('<span style="color:green">' + obj['Url'] + '</span></br>');
                } else {
                    $("#divResult").append('<span style="color:green">' + obj['Url'] + '</span></br>');
                }
            }
            else {
                invalidCount += 1;
                if (type == 'excel') {
                    $("#divResultExcel").append('<span style="color:red">' + obj['Url'] + '</span></br>');
                } else {
                    $("#divResult").append('<span style="color:red">' + obj['Url'] + '</span></br>');
                }
            }


        });
        if (type == "excel") {
            $('#totalExcel').empty().append(validCount + invalidCount);
            $('#duplicateTotalExcel').empty().append(invalidCount);
            $('#uniqueTotalExcel').empty().append(validCount);
        }
        else {
            $('#total').empty().append(validCount + invalidCount);
            $('#duplicateTotal').empty().append(invalidCount);
            $('#uniqueTotal').empty().append(validCount);
        }

    }
}

AjaxSucessed = function (data) {
}

AjaxFailed = function (e) {
    console.log(e);
}

ResetForm = function () {
    $('#totalExcel').empty();
    $('#duplicateTotalExcel').empty();
    $('#uniqueTotalExcel').empty();
    $('#total').empty();
    $('#duplicateTotal').empty();
    $('#uniqueTotal').empty();
    $("#divResultExcel").empty();
    $("#divResult").empty();
    $("#txtUrl").val('');
    $("#excelfile").val('');
    $('#fileSpan').empty().append('Choose file');
}

ProcessExcel = function () {
    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
    /*Checks whether the file is a valid excel file*/
    if (regex.test($("#excelfile").val().toLowerCase())) {
        var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
        if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
            xlsxflag = true;
        }
        /*Checks whether the browser supports HTML5*/
        if (typeof (FileReader) != "undefined") {
            var reader = new FileReader();
            reader.onload = function (e) {
                var data = e.target.result;
                /*Converts the excel data in to object*/
                if (xlsxflag) {
                    var workbook = XLSX.read(data, { type: 'binary' });
                }
                else {
                    var workbook = XLS.read(data, { type: 'binary' });
                }

                var sheet_name_list = workbook.SheetNames;

                var cnt = 0;
                sheet_name_list.forEach(function (y) {
                    if (xlsxflag) {
                        var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                    }
                    else {
                        var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                    }
                    if (exceljson.length > 0 && cnt == 0) {
                        GetJson(exceljson);
                        cnt++;
                    }
                });
            }
            if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
            }
            else {
                reader.readAsBinaryString($("#excelfile")[0].files[0]);
            }
        }
        else {

            $('#fileSpan').empty().append('Choose file');
            alert("Sorry! Your browser does not support HTML5!");
        }
    }
    else {
        $('#fileSpan').empty().append('Choose file');
        alert("Please upload a valid Excel file!");
    }
}

capitalize = function (string) {
    return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
}
GetJson = function (jsondata) {/*Function used to convert the JSON array to Html Table*/
    excelJsonUrls = "";
    var columns = BindHeader(jsondata);
    for (var i = 0; i < jsondata.length; i++) {
        for (var colIndex = 0; colIndex < columns.length; colIndex++) {
            var cellValue = jsondata[i][columns[colIndex]];
            if (cellValue == null)
                cellValue = "";
            excelJsonUrls += cellValue + "\n";
        }
    }

    setTimeout(function () { capitalize($('#fileSpan').empty().append($("#excelfile").val().split('\\').pop())+' uploaded click to save'); }, 2000);
}

BindHeader = function (jsondata) {/*Function used to get all column names from JSON and bind the html table header*/
    var columnSet = [];

    for (var i = 0; i < jsondata.length; i++) {
        var rowHash = jsondata[i];
        for (var key in rowHash) {
            if (rowHash.hasOwnProperty(key)) {
                if ($.inArray(key, columnSet) == -1) {/*Adding each unique column names to a variable array*/
                    columnSet.push(key);

                }
            }
        }
    }

    return columnSet;
}