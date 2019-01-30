$(function(){
var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
$('#post-pop').on(_touch, function (){
    $('#post-modal').fadeIn();
});

$('.close-modal').on(_touch, function(){
    $('#post-modal').fadeOut();
})
});

$(function() {
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
  $('.reply').on(_touch, function () {
    $('.inbox-main-wrapper1').show();
    $('.inbox-main-wrapper2').hide();
    $('.reply').css('background-color','#ffd6d6');
    $('.no-reply').css('background-color','#fff');
    $('.reply p').css('color','#919191');
    $('.no-reply p').css('color','#919191');
    $('.no-reply').css('border', '1px solid #cfcfcf');
  });
  $('.no-reply').on(_touch, function () {
    $('.inbox-main-wrapper1').hide();
    $('.inbox-main-wrapper2').show();
    $('.no-reply').css('background-color','#ffd6d6');
    $('.reply').css('background-color','#fff');
    $('.reply p').css('color','#919191');
    $('.no-reply p').css('color','#919191');
    $('.reply').css('border', '1px solid #cfcfcf');
});

});
