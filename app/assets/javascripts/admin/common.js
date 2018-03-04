//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require dist/js/adminlte.min
//= require_tree .
//= require base

function toggleSidebar() {
    var $html = $('html');
    var is_sidebar_collapsed = $html.hasClass('sidebar-collapse');
    if (is_sidebar_collapsed) {
        $html.removeClass('sidebar-collapse');
    } else {
        console.log('is_sidebar_collapsed:', is_sidebar_collapsed)
        $html.addClass('sidebar-collapse');
    }
}
