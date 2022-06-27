$(function() {
var html = $('html, body'),
navContainer = $('.nav-container'),
navToggle = $('.nav-toggle'),
navDropdownToggle = $('.has-dropdown');


// Nav toggle (dropdown menu)
navToggle.on('click', function(e) {
var $this = $(this);
e.preventDefault();
$this.toggleClass('is-active');
navContainer.toggleClass('is-visible');
// html.toggleClass('nav-open');
});




// Nav dropdown toggle (sub-menu)
navDropdownToggle.on('click', function() {
var $this = $(this);
$this.toggleClass('is-active').children('ul').toggleClass('is-visible');
});

// Prevent click events from firing on children of navDropdownToggle
navDropdownToggle.on('hover', '*', function(e) {
e.stopPropagation();
});
});