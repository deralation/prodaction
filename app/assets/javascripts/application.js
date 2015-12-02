//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree.


console.log('test')


$(window).scroll(function() {
    if ($(this).scrollTop() > 200){ // Set position from top to add class
        $('.navbar').addClass("scrolled");
    } else {
        $('.navbar').removeClass("scrolled");
    }
});
