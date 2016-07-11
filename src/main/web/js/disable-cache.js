function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = location.search.substr(1).match(reg);
    if (r != null) return unescape(decodeURI(r[2]));
    return null;
}

function noCache() {
    if (!getQueryString("vincent")) {
        var s = Math.random(5);
        window.location.href = document.location.pathname + "?vincent=" + s;
    }
}

$(document).ready(function () {
    noCache();
});