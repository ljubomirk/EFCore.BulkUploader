var config = {
    options: {
        table: {
            responsive: true,
            pageLength: 10,
            searching: false,
            info: false,
            lengthChange: false,
            pagingType: "full_numbers",
            language: {
                infoEmpty: '@CouponDatabase.Properties.Resources.Filter_NoResults',
                paginate: {
                    first: '<i class="material-icons">first_page</i>',
                    last: '<i class="material-icons">last_page</i>',
                    next: '<i class="material-icons">chevron_right</i>',
                    previous: '<i class="material-icons">chevron_left</i>'
                }
            },
            columnDefs: [
                { orderable: false, targets: -1 }
            ],
            drawCallback: function () {
                $('.dataTables_paginate > a.paginate_button').addClass('waves-effect');
            }
        },
        dropdown: {
            constrainWidth: false,
            alignment: 'right',
            outDuration: 100,
            onCloseEnd: function () {
                // this fixes the "3 click bug" when dropbox opens and next click is another dropdown
                $("body").click();
            }
        },
        tabs: { swipeable: true }
    },
    helpers: {
        calendar: {
            validation: function (data) {
                // eg. for true - do
                // input.removeClass("invalid").addClass("valid");
                var re = /^[0-9]{2}.[0-9]{2}.[0-9]{4}$/;
                return re.test(data);
            }
        }
    }
}


