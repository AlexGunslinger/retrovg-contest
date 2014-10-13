$( document ).ready(function() {
  (function() {
    if( $('.game-list').length ){
      $('.games-container').BlocksIt({
        numOfCol: 4
      });
    }
  })();

});