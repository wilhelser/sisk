//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
$(function() {
  $(document).foundation();
  $('.hideform-trigger').click(function() {
    $('.formhide').slideToggle();
  });
});
