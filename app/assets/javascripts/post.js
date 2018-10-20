$(function(){

$('#post-pop').fastClick(function (){
    $('#post-modal').fadeIn();
});

$('.close-modal').fastClick(function(){
    $('#post-modal').fadeOut();
})
});

$(function() {
  $('.reply').fastClick(function () {
    $('.inbox-main-wrapper1').show();
    $('.inbox-main-wrapper2').hide();
    $('.reply').css('background-color','#ffd6d6');
    $('.no-reply').css('background-color','#fff');
    $('.reply p').css('color','#919191');
    $('.no-reply p').css('color','#919191');
    $('.no-reply').css('border', '1px solid #cfcfcf');
  });
  $('.no-reply').fastClick(function () {
    $('.inbox-main-wrapper1').hide();
    $('.inbox-main-wrapper2').show();
    $('.no-reply').css('background-color','#ffd6d6');
    $('.reply').css('background-color','#fff');
    $('.reply p').css('color','#919191');
    $('.no-reply p').css('color','#919191');
    $('.reply').css('border', '1px solid #cfcfcf');
});

});
