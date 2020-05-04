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
                $("a.dropdown-trigger__table").dropdown(config.options.dropdown);
            },
            dom: 'frtipB',
            buttons: [{
                extend: 'excelHtml5',
                text: '<i class= "material-icons left" >file_download</i>Export',
                titleAttr: 'Export'
            }]
        },
        dropdown: {
            constrainWidth: false,
            alignment: 'right',
            outDuration: 100
            //onCloseEnd: function () {
            //}
        },
        tabs: { swipeable: true },
        tooltips: { position: 'bottom' }
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


