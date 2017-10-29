var Id = 0;
$(document).ready(function () {
    FillGridView();
   
    $('#btnSave').click(function () {
        var bankName = $('#txtBankName').val();    
        if (bankName != '') {
            SaveData(bankName);
            ResetForm();
        }
    });

    $('#lnkNew').click(function () {
        ShowHideModel('true');
        $('#headingTitle').empty().append('Add Bank');
    });

    $(document).on('click', '.edit', function () {
        ShowHideModel('true');
        $('#headingTitle').empty().append('Edit Bank');
        Id = $(this).closest('tr').find('input[type="hidden"]').val();
        $.ajax({
            type: "POST",
            url: "BankMaster.aspx/GetEditRecord",
            contentType: "application/json; charset=utf-8",
            data: "{'id':'" + Id + "'}",
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
    });

});

FillEditControls = function (data) {
    if (data.d != null) {
        ResetForm();
        $('#txtBankName').val(data.d["BankName"]);
    }
}

SaveData = function (masterData) {
    $.ajax({
        type: "POST",
        url: "BankMaster.aspx/SaveBank",
        contentType: "application/json; charset=utf-8",
        data: "{'bankName':'" + masterData + "', 'id':'" + Id + "'}",
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
        url: "BankMaster.aspx/GetBanks",
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
    $("#tblBank").DataTable({
        "pageLength": 10,
        "ordering": true
    });
}

LoadGrid = function (data) {
    var item = "<table id='tblBank' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending' aria-label='First Name: activate to sort column descending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-label='Last Name: activate to sort column ascending'>Bank Name</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["BankName"] + "</td>";
        item += "<td class='text-center'><a href='#' id='edit-" + data.d[i]["Id"] + "' class='edit'><i class='icon-pencil'></i></a><input type='hidden' value='" + data.d[i]["Id"] + "' /></td>";
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

ShowHideModel = function (flag) {
    $('#modal_form_vertical').modal({
        show: flag
    });
};