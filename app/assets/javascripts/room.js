// トークルーム通報
$(function() {
  $('#room-report').fastClick(function () {
    $('.report-wrapper').show();
    });
    $('.report-close span').click(function () {
      $('.report-wrapper').hide();
    })
})
