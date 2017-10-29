var showHideLoader = function (isVisible) {
    if (isVisible) {
        $('.loader').show();
    }
    else {
        $('.loader').hide();
    }
}

var showHideLoaderWithScroll = function (isVisible) {
    if (isVisible) {
        document.getElementsByClassName("loader").style.display = "block";

    }
    else {
        document.getElementsByClassName("loader").style.display = "none";

    }

}

var showHideDivLoader = function (isVisible, overlayName) {
    var overLayCtrl = document.getElementById(overlayName);
    if (overLayCtrl) {
        if (isVisible) {
            overLayCtrl.style.display = "block";
        }
        else {
            overLayCtrl.style.display = "none";
        }
    }
}