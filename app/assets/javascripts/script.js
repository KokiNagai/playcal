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
});
