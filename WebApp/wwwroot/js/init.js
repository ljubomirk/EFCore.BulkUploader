$(document).ready(function () {
    // init tooltip model validations
    if ($(".validation-error").length > 0) $("input[data-tooltip]").tooltip(config.options.tooltips);

    // init calendars in forms
    if ($(".calendar").length > 0) {
        $(".calendar").calendar(config.options.calendar).on('changeDate', function (e) {
            // prevents out of focus
            $(this).focus();
        });
        // open calendar on icon click
        $(".date-icon").on('click', function () {
            $(this).parent().children('.calendar').calendar("show");
            //var dateField = $(this).parent().children('.calendar');
            //dateField[0].click(function () { console.log("click")});
            //console.log(dateField[0])
        })
    }

    // init tabs
    if ($(".tabs-section").length > 0) $(".tabs-section").tabs(config.options.tabs);

    // init table
    if ($("table").length > 0) {
        var column = $("table")[0].getAttribute("data-nosort-target");

        // set colum that is not sortable
        if (column) {
            var target = parseInt(column)
            config.options.table.columnDefs[0].targets = target;
        } else {
            config.options.table.columnDefs = [];
        }
        $('table').DataTable(config.options.table);

        // handle sorting icon
        $("th").click(function () {
            var className = $(this).attr("class");
            var icon = $(this).children(".sorting-icon");
            var allIcons = $(".sorting-icon");

            var oldSrc = "/images/sorting_hidden.png";
            var newSrc = "/images/" + className + ".png";
            // reset all icons
            allIcons.each(function () {
                if (this.getAttribute("src") != oldSrc) {
                    console.log("nasao")
                    this.setAttribute("src", oldSrc);
                }
            })
            icon.attr("src", newSrc);
        })
    }

    // init dropdowns
    if ($('.dropdown-trigger').length > 0) $('.dropdown-trigger').dropdown(config.options.table);

    // init modals
    if ($(".modal").length > 0) {
        $(".modal").modal();
        // close modal with button inside
        $(".modal-close").click(function () {
            $('.modal').modal('close');
        });
    }

    // init select fields
    if ($('select').length > 0) $('select').formSelect();

    // prevent enter to submit form
    $(window).keydown(function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
            return false;
        }
    });
})