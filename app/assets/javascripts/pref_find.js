// 県名プルダウン（検索）
$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn1').on(_touch, function(){
		$('.find-pref-button1').toggleClass('dropdown_toggle').children('.find-pref-1').slideToggle(400);
    $('.find-pref-button1').toggleClass('find-pref-btn-shadow');
	});
});

$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn2').on(_touch, function(){
		$('.find-pref-button2').toggleClass('dropdown_toggle').children('.find-pref-2').slideToggle(400);
    $('.find-pref-button2').toggleClass('find-pref-btn-shadow');
	});
});

$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn3').on(_touch, function(){
		$('.find-pref-button3').toggleClass('dropdown_toggle').children('.find-pref-3').slideToggle(400);
    $('.find-pref-button3').toggleClass('find-pref-btn-shadow');
	});
});

$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn4').on(_touch, function(){
		$('.find-pref-button4').toggleClass('dropdown_toggle').children('.find-pref-4').slideToggle(400);
    $('.find-pref-button4').toggleClass('find-pref-btn-shadow');
	});
});

$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn5').on(_touch, function(){
		$('.find-pref-button5').toggleClass('dropdown_toggle').children('.find-pref-5').slideToggle(400);
    $('.find-pref-button5').toggleClass('find-pref-btn-shadow');
	});
});

$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn6').on(_touch, function(){
		$('.find-pref-button6').toggleClass('dropdown_toggle').children('.find-pref-6').slideToggle(400);
    $('.find-pref-button6').toggleClass('find-pref-btn-shadow');
	});
});

$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn7').on(_touch, function(){
		$('.find-pref-button7').toggleClass('dropdown_toggle').children('.find-pref-7').slideToggle(400);
    $('.find-pref-button7').toggleClass('find-pref-btn-shadow');
	});
});
$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn8').on(_touch, function(){
		$('.find-pref-button8').toggleClass('dropdown_toggle').children('.find-pref-8').slideToggle(400);
    $('.find-pref-button8').toggleClass('find-pref-btn-shadow');
	});
});
$(function(){
  var _touch = ('ontouchstart' in document) ? 'touchstart' : 'click';
	$('.pref-btn9').on(_touch, function(){
		$('.find-pref-button9').toggleClass('dropdown_toggle').children('.find-pref-9').slideToggle(400);
    $('.find-pref-button9').toggleClass('find-pref-btn-shadow');
	});
});


// 投稿検索ドロップダウン
$(function() {
  $('.gender-JS').on('click', function() {
    $('.search-modal-wrapper').toggleClass('search-modal-display').fadeIn(400);
  })
  $('i#close-modal').on('click', function() {
    $('.search-modal-wrapper').toggleClass('search-modal-display').fadeOut(400);
  })
})


// スマホ　ハンバーガードロップダウン
$(function() {
  $('#dropdown-fontawesome').fastClick(function () {
    $('.dropdown-modal-wrapper').slideDown();
  });

  $('#close-modal').fastClick(function() {
    $('.dropdown-modal-wrapper').slideUp();
  });
});