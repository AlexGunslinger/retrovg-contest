$( document ).ready(function() {
  (function() {
    if( $('.game-list').length ){
      var winWidth = $(window).width();
      var conWidth;
      if(winWidth < 660) {
        conWidth = winWidth;
        col = 1
      } else if(winWidth < 880) {
        conWidth = 660;
        col = 2
      } else if(winWidth < 1100) {
        conWidth = 880;
        col = 3;
      } else {
        conWidth = 1100;
        col = 5;
      }
      $('.games-container').width(conWidth);
      $('.games-container').BlocksIt({
          numOfCol: col,
          offsetX: 5,
          offsetY: 5
        });
    }
  })();
});