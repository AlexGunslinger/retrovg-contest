$( document ).ready(function() {
  (function() {
    if( $('.game-list').length ){
      var winWidth = $(window).width();
      var conWidth;
      if(winWidth < 660) {
        conWidth = 440;
        col = 2
      } else if(winWidth < 880) {
        conWidth = 660;
        col = 3
      } else if(winWidth < 1100) {
        conWidth = 880;
        col = 4;
      } else {
        conWidth = 1100;
        col = 5;
      }
      $('.games-container').width(conWidth);
      $('.games-container').BlocksIt({
          numOfCol: col,
          offsetX: 8,
          offsetY: 8
        });
    }
  })();
});