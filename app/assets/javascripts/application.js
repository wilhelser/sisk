//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
$(function() {
  $(document).foundation();
  $('.hideform-trigger').click(function() {
    $('.formhide').slideToggle();
  });
  $('.section-reveal').click(function() {
    var toggle = $(this).data('toggle');
    $(toggle).slideToggle();
  });
});
