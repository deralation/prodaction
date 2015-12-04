//= require jquery
//= require jquery_ujs
//= require toastr
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require toastr
//= require_tree.





$(window).scroll(function() {
    if ($(this).scrollTop() > 200){ // Set position from top to add class
        $('.navbar').addClass("scrolled");

    } else {
        $('.navbar').removeClass("scrolled");
    }
});


