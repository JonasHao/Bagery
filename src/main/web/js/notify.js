/**
 * Created by Koche on 2016/7/7.
 */
function notify(str) {
    setTimeout(function () {
            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 4000
            };
            toastr.success(str);

        },
        1300);
}

