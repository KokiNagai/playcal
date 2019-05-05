// user/show　投稿切り替え
$(function() {
  $('.user-post-recrut').fastClick(function() {
    $('.user-post-show-2').show();
    $('.user-post-show-1').hide();
    $('.user-post-recrut').css('border-bottom', '4px solid #9cd75b');
    $('.user-post-recrut p').css('color', '#9cd75b');
    $('.user-post-count p').css('color', '#919191');
    $('.user-post-count').css('border-bottom', 'none');
  });

  $('.user-post-count').fastClick(function() {
    $('.user-post-show-2').hide();
    $('.user-post-show-1').show();
    $('.user-post-count').css('border-bottom', '4px solid #9cd75b');
    $('.user-post-count p').css('color', '#9cd75b');
    $('.user-post-recrut p').css('color', '#919191');
    $('.user-post-recrut').css('border-bottom', 'none');
  });
});

// ユーザー編集　プロフィール画像
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#edit-pic').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $(".edit-img").change(function(){
    readURL(this);
  });
 });
 
 
 // ユーザメニューオンオフ
 $(function() {
   $('#user-menu').on('click', function() {
     $('.user-show-menu-wrap').toggleClass('user-menu-toggle').slideToggle(400);;
   })
 })