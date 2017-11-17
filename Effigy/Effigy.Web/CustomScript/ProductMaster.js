$(document).ready(function () {
    FillGridView();

    $('#btnSave').click(function () {

        var txtTax = $('#txtTax').val();
        var productCode = $('#txtProductCode').val();
        alert(txtTax + '' + productCode);
        var productData = new Product(0, productCode, $('#txtProductName').val(), $('#txtDesc').val(),
            $('#txtJoiningPrice').val(), $('#txtInroPercentage').val(),
            $('#txtWorkPer').val(), $('#txtEntryRate').val(), txtTax);

        SaveData(productData);
        ResetPage();
        // ResetForm();
    });

    $("#txtTax").keyup(function () {
        var tax = $('#txtTax').val();
        var joiningPrice = $('#txtJoiningPrice').val();
        var totalPrice = parseFloat(joiningPrice) + parseFloat(joiningPrice * (tax / 100));
        $('#txtTotalPrice').val(totalPrice);


    });

    $("#txtJoiningPrice").keyup(function () {
        var tax = $('#txtTax').val();
        var joiningPrice = $('#txtJoiningPrice').val();
        var totalPrice = parseFloat(joiningPrice) + parseFloat(joiningPrice * (tax / 100));
        $('#txtTotalPrice').val(totalPrice);
    });

    $('#btnReset').click(function () {
        ResetPage();
    });
});


FillGridView = function () {
    $.ajax({
        type: "POST",
        url: "ProductMaster.aspx/GetProductList",
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
    $("#tblState").DataTable({
        "pageLength": 10,
        "ordering": true
    });

}

LoadGrid = function (data) {
    var item = "<table id='tblState' class='table datatable-pagination dataTable no-footer' role='grid' aria-describedby='DataTables_Table_0_info'>";
    item += "<thead> <tr role='row'>";
    item += "<th class='sorting_asc' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1' aria-sort='ascending'>S.No.</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Category Code</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Category Name</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Joining Price</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Member Intro %</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Member Work %</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Total Tax(GST)</th>";
    item += "<th class='sorting' tabindex='0' aria-controls='DataTables_Table_0' rowspan='1' colspan='1'>Total Amount</th>";
    item += "<th class='text-center sorting_disabled' rowspan='1' colspan='1' style='width: 100px;' aria-label='Actions'>Actions</th></tr></thead>";
    item += "<tbody>";
    for (var i = 0; i < data.d.length; i++) {
        item += "<tr role='row'>";
        item += "<td class='sorting_1'>" + parseInt(i + 1) + "</td>";
        item += "<td>" + data.d[i]["CategoryCode"] + "</td>";
        item += "<td>" + data.d[i]["CategoryName"] + "</td>";
        item += "<td>" + data.d[i]["CategoryPrice"] + "</td>";
        item += "<td>" + data.d[i]["CatIntroPercentage"] + "</td>";
        item += "<td>" + data.d[i]["CatWorkPercentage"] + "</td>";
        item += "<td>" + data.d[i]["Tax"] + "</td>";
        item += "<td>" + data.d[i]["TotalAmount"] + "</td>";
        item += "<td class='text-center'><a href='#' data-toggle='modal' data-target='#modal_form_vertical'><i class='icon-pencil'></i></a></td>";
        item += "</tr>";
    }
    item += "</tbody></table>";
    $('#dvGrid').append(item);

}

AjaxFailed = function (e) {
    console.log(e);
}

SaveData = function (productData) {
    $.ajax({
        type: "POST",
        url: "ProductMaster.aspx/SaveUpdateCategory",
        contentType: "application/json; charset=utf-8",
        data: "{'objProduct':" + JSON.stringify(productData) + "}",
        dataType: "json",
        success: AjaxSucessed,
        error: AjaxFailed,
        beforeSend: function () {
            showHideLoader(true);
        },
        complete: function () {
            FillGridView();
            showHideLoader(false);
        }
    });

}

Product = function (id, categoryCode, categoryName, categoryDesc, categoryPrice, catIntroPercentage, catWorkPercentage, workRate, tax) {
    this.Id = id;
    this.CategoryCode = categoryCode;
    this.CategoryName = categoryName;
    this.CategoryDesc = categoryDesc;
    this.CategoryPrice = categoryPrice;
    this.CatIntroPercentage = catIntroPercentage;
    this.CatWorkPercentage = catWorkPercentage;
    this.WorkPaymentRate = workRate;
    this.Tax = tax;
}

ResetPage = function () {
    $("#txtProductName").val('');
    $("#txtDesc").val('');
    $("#txtJoiningPrice").val('');
    $("#txtInroPercentage").val('');
    $("#txtWorkPer").val('');
    $("#txtEntryRate").val('');
    $("#txtTax").val('');
    $('#txtTotalPrice').val('');
}