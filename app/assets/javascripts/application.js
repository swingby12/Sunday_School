// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require bootstrap
//= require bootstrap-editable-inline
//= require bootstrap-editable-rails
//= require_tree .

function flash_display(type, str)
{
    var str = "<div class='alert alert-"+type+"'><button type='button' class='close' data-dismiss='alert'>&times;</button>"+str+"</div>";
    $("#flash").html( str );
}

$(function () {
    $('#ss_class_instructor_tokens').tokenInput('/users/search.json', {
        crossDomain: false,
        prePopulate: $('#ss_class_instructor_tokens').data('pre'),
        theme: 'facebook'
    });
});

$(function () {
    $('#ss_class_session_attendance_tokens').tokenInput('/users/search.json', {
        crossDomain: false,
        prePopulate: $('#ss_class_session_attendance_tokens').data('pre'),
        theme: 'facebook'
    });
});