// 通知プルダウン
$(function() {
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
  $('.JS-bell').on(_touch, function() {
    $('.notification-wrapper').fadeIn();
  });
  $('.close-cross').on(_touch, function() {
    $('.notification-wrapper').fadeOut();
  });
});
