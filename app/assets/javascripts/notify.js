$(function() {
  $('.JS-bell').click(function() {
    $('.notification-wrapper').fadeIn();
  });
  $('#close-cross').click(function() {
    $('.notification-wrapper').fadeOut();
  });
});
