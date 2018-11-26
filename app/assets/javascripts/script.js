$(function(){

$('#signin-pop').fastClick(function (){
    $('#login-modal').fadeIn();
});

$('.close-modal').click(function(){
    $('#login-modal').fadeOut();
})
});

$(function() {

  $('#dropdown-fontawesome').fastClick(function () {
    $('.dropdown-modal-wrapper').slideDown();
  });

  $('#close-modal').fastClick(function() {
    $('.dropdown-modal-wrapper').slideUp();
  });
});

$(function() {
  $('.gender-JS').on('click', function() {
    $('.search-modal-wrapper').toggleClass('search-modal-display').fadeIn(400);
  })
  $('i#close-modal').on('click', function() {
    $('.search-modal-wrapper').toggleClass('search-modal-display').fadeOut(400);
  })
})

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

$(function() {
  $('#room-report').fastClick(function () {
    $('.report-wrapper').show();
    });
    $('.report-close span').click(function () {
      $('.report-wrapper').hide();
    })
})

window.onpageshow = function(event) {
	if (event.persisted) {
		 window.location.reload();
	}
};

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

$(function() {
  $('#user-menu').on('click', function() {
    $('.user-show-menu-wrap').toggleClass('user-menu-toggle').slideToggle(400);;
  })
})


$(function() {
  $('#post-menu').on('click', function() {
    $('.post-menu-list').fadeToggle(400);
  })
})


$(function() {
  $('#post-menu1').on('click', function() {
    $('.post-menu-list1').fadeToggle(400);
  })
})


// $(function() {
//      $('#edit-file-input').css({
//          'position': 'absolute',
//          'top': '-9999px'
//      }).change(function() {
//          var val = $(this).val();
//          var path = val.replace(/\\/g, '/');
//          var match = path.lastIndexOf('/');
//     $('#edit-pic-name').css("display","inline-block");
//          $('#edit-pic-name').val(match !== -1 ? val.substring(match + 1) : val);
//      });
//      $('#edit-pic-name').bind('keyup, keydown, keypress', function() {
//          return false;
//      });
//      $('#edit-pic-name, #edit-pic-btn').click(function() {
//          $('#edit-file-input').trigger('click');
//      });
//  });
