$(function() {
  $('.JS-bell').fastClick(function() {
    $('.notification-wrapper').fadeIn();
  });
  $('.close-cross').fastClick(function() {
    $('.notification-wrapper').fadeOut();
  });
});
