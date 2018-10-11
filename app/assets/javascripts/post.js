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
    $('.reply').css('background-color','#5f9ea0');
    $('.no-reply').css('background-color','#fff');
    $('.reply p').css('color','#fff');
    $('.no-reply p').css('color','#4c4c4c');
    $('.no-reply').css('border', '1px solid #cfcfcf');
  });
  $('.no-reply').click(function () {
    $('.inbox-main-wrapper1').hide();
    $('.inbox-main-wrapper2').show();
    $('.no-reply').css('background-color','#5f9ea0');
    $('.reply').css('background-color','#fff');
    $('.reply p').css('color','#4c4c4c');
    $('.no-reply p').css('color','#fff');
    $('.reply').css('border', '1px solid #cfcfcf');
});

});
