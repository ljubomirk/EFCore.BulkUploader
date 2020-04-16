$(document).ready(function () {
    // server-side validation
    var errHolder = $('.validation-error')
    if (errHolder) {
        errHolder.tooltip();
        errHolder.siblings("input").addClass("invalid");
        errHolder.siblings("input")
            .mouseenter(function () {
                $(this).siblings(".validation-error").tooltip('open');

            }).mouseleave(function () {
                $(this).siblings(".validation-error").tooltip('close');

            }).change(function () {
                $(this).removeClass("invalid");
                var icon = $(this).siblings(".validation-error");

                if ($(this).hasClass("calendar")) {
                    console.log(icon);
                    icon.removeClass("validation-error").html("event");
                } else {
                    icon.remove();
                }
            })
    }
})