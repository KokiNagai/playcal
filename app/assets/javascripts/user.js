function postList(number) {
  let pl = document.querySelector('.post-menu-list-' + number )
  var style = (pl.currentStyle || document.defaultView.getComputedStyle(pl, ''));
  if (style.display == "none") {
    pl.style.display = "block";
  } else if (style.display == "block") {
    pl.style.display = "none";
  }
};

function postList2(number1) {
  let pl = document.querySelector('.post-menu-list1-' + number1 )
  var style = (pl.currentStyle || document.defaultView.getComputedStyle(pl, ''));
  if (style.display == "none") {
    pl.style.display = "block";
  } else if (style.display == "block") {
    pl.style.display = "none";
  }
};
