$(document).ready(function(){
  var SOLUTIONS = ["1,2,3", "4,5,6", "7,8,9", "1,4,7", "2,5,8", "3,6,9", "1,5,9", "3,5,7"]

  gameStart()
  function gameStart(){
    insertGrid()
    $('#player').on("click", playerGame)
    $('#computer').on("click", computerGame)
  };

  function insertGrid(){
    for (var i=0; i < 3; i++) {
      var rows = '<div class="rows"></div>';
      $('.game').append(rows);
    };
    for (var j=0; j < 3; j++) {
      var boxes = $('<div class="boxes"></div>');
      $('.rows').append(boxes); 
    };
    $('.boxes').css({
      "border": "3px solid rgba(255, 248, 243, 0.8)", 
    })
    for (var x=0; x < 9; x++) {
      $('.boxes').eq(x).attr("id", "box" + (x + 1))
    }
    $("#box1").css({
      'border-radius': '15px 0 0 0'
    });
    $("#box3").css({
      'border-radius': '0 15px 0 0'
    });
    $("#box7").css({
      'border-radius': '0 0 0 15px'
    });
    $("#box9").css({
      'border-radius': '0 0 15px 0'
    });
  };

  function playerGame(){
    var turn = 0;
    var player1 = [];
    var player2 = [];

    while (player1 != "win") {
      hoverPreview(turn)
    }
  };

  function computerGame(){
    
  };

  function hoverPreview(turn){
    if (turn % 2 === 0) {
      $('.boxes').hover(function(){
        $(this).css('background-color', 'rgba(92, 221, 92, 0.6)')
      }, function() {
        $(this).css('background-color', 'rgba(255, 164, 88, 0.6)')
      });
    } else if (turn % 2 != 0) {
      $('.boxes').hover(function(){
        $(this).css('background-color', 'rgba(255, 107, 107, 0.6)')
      }, function() {
        $(this).css('background-color', 'rgba(255, 164, 88, 0.6)')
      });
    };
  };
});