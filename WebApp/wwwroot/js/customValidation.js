$(document).ready(function () {
    $("form").validate();
    // check for invalid inputs on render
    setValidationMessage();

    // on blur check if field valid again
    $("input").on('blur', function () {
        checkField($(this));
    })

    // initial validation of fields
    function setValidationMessage() {
        var invalidInput = $("input.invalid");
        if (invalidInput.length > 0) {
            for (var i = 0; i < invalidInput.length; i++) {
                checkField(invalidInput);
            }
        }
    }
    // single field validation
    function checkField(el) {
        if (el.hasClass('invalid')) {
            console.log("INVALID")
            var errMsg = el.siblings('.field-validation-error').find('span').html();
            // check if date and remove icon
            if (el.hasClass("calendar")) el.siblings("i.date-icon").hide();

            // attach err msg and initiate tooltip
            el.attr("data-tooltip", errMsg);
            el.siblings(".validation-error").show();
            el.tooltip();
            // triger input hover over icon
            $('.validation-error').hover(function (e) {
                $(this).siblings("input.invalid").trigger(e.type);
            })

        } else {
            console.log("valid")
            // remove error icon
            el.siblings('.validation-error').hide();
            // check if date and add icon
            if (el.hasClass("calendar")) el.siblings("i.date-icon").show();
            //remove tooltip
            if (el.attr('data-tooltip')) {
                el.removeAttr("data-tooltip");
                el.tooltip('destroy');
            }
        }
    }
})