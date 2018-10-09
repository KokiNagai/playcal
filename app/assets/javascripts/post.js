$(function(){

$('#post-pop').click(function (){
    $('#post-modal').fadeIn();
});

$('.close-modal').click(function(){
    $('#post-modal').fadeOut();
})
});

$(function() {
  $('.reply').click(function () {
    $('.inbox-main-wrapper1').show();
    $('.inbox-main-wrapper2').hide();
    $('.reply').css('background-color','#ffd6d6');
    $('.no-reply').css('background-color','#fff');
  });
  $('.no-reply').click(function () {
    $('.inbox-main-wrapper1').hide();
    $('.inbox-main-wrapper2').show();
    $('.no-reply').css('background-color','#ffd6d6');
    $('.reply').css('background-color','#fff');
});

});
