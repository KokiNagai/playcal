$(function(){

$('#signin-pop').click(function (){
    $('#login-modal').fadeIn();
});

$('.close-modal').click(function(){
    $('#login-modal').fadeOut();
})
});

$(function() {

  $('#dropdown-fontawesome').click(function () {
    $('.dropdown-modal-wrapper').slideDown();
  });

  $('#close-modal').click(function() {
    $('.dropdown-modal-wrapper').slideUp();
  });
});


$(function(){

  $(document).on('click', function(e) {
    // ２．クリックされた場所の判定
    if(!$(e.target).closest('.search-modal').length && !$(e.target).closest('.gender-JS').length){
        $('.search-modal-wrapper').fadeOut();
    } else if($(e.target).closest('.gender-JS').length){
        // ３．ポップアップの表示状態の判定
        if($('.search-modal-wrapper').is(':hidden')){
            $('.search-modal-wrapper').fadeIn();
        }else{
            $('.search-modal-wrapper').fadeOut();
        }
    }
});

$('.close-modal2').click(function() {
  $('.search-modal-wrapper').fadeOut();
});
});

$(function() {
  $('.user-post-recrut').click(function() {
    $('.user-post-show-2').show();
    $('.user-post-show-1').hide();
    $('.user-post-recrut').css('background-color', '#5f9ea0');
    $('.user-post-recrut p').css('color', '#fff');
    $('.user-post-count').css('background-color', '#fff');
    $('.user-post-count p' ).css('color', '#4c4c4c');
    $('.user-post-count').css('border', '1px solid #cfcfcf');
  });

  $('.user-post-count').click(function() {
    $('.user-post-show-2').hide();
    $('.user-post-show-1').show();
    $('.user-post-count').css('background-color', '#5f9ea0');
    $('.user-post-count p').css('color', '#fff');
    $('.user-post-recrut').css('background-color', '#fff');
    $('.user-post-recrut p' ).css('color', '#4c4c4c');
    $('.user-post-recrut').css('border', '1px solid #cfcfcf');
  });

});

$(function() {
  $('#room-report').click(function () {
    $('.report-wrapper').show();
    });
    $('.report-close span').click(function () {
      $('.report-wrapper').hide();
    })
})
