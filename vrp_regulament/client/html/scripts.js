

var uwu = null;
var hentai = null;
var here = null;

$(document).ready(function () {
  $(".container").hide();
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      open();
      openHome();
    }
    if (item.show == false) {
      close();
    }
    if(uwu.hentai && uwu.maxhentai) {
      $('').html(uwu.hentai + "/" + uwu.maxhentai + '');
    }
  });
  
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post('http://vrp_regulament/close', JSON.stringify({}));
    }
  };
  $(".uwu-inchide").click(function () {
    $.post('http://vrp_regulament/close', JSON.stringify({}));
  });
});

function open() {
  $(".container").fadeIn();
  clearSelectedItem();
}
function close() {
  $(".container").fadeOut();
  $("#home").css("display", "none");
  clearSelectedItem();
}
function openHome() {
  $("#home").css("display", "block");
}

function clearSelectedItem() {
  $("#uwuitems div").css("background-color", "#ececec");
}