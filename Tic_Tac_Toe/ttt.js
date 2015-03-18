$(document).ready(function(){
  var SOLUTIONS = ["1,2,3", "4,5,6", "7,8,9", "1,4,7", "2,5,8", "3,6,9", "1,5,9", "3,5,7"]

  gameStart()
  function gameStart(){
    insertGrid()
    $('#player').on("click", playerGame)
    $('#computer').on("click", computerGame)
  };
});

function insertGrid(){
  for (var i=0; i < 3; i++) {
    var rows = '<div class="rows"></div>';
    $('.game').append(rows);
  };
  for (var j=0; j < 3; j++) {
    var boxes = $('<div class="boxes"></div>');
    $('.rows').append(boxes); 
  };
  for (var x=0; x < 9; x++) {
    $('.boxes').eq(x).attr("id", "box" + (x + 1))
  }
  $("#box1").css({'border-radius': '15px 0 0 0'});
  $("#box3").css({'border-radius': '0 15px 0 0'});
  $("#box7").css({'border-radius': '0 0 0 15px'});
  $("#box9").css({'border-radius': '0 0 15px 0'});
};

function playerGame(){
  var turn = 0;
  var freeSpaces = [1,2,3,4,5,6,7,8,9]
  var player1 = [];
  var player2 = [];
  $('.boxes').empty()
  playerMove(turn);
};

function computerGame(){
  
};

function  playerMove(turn){
  if (turn % 2 === 0){
    console.log("A")
    movePreLogic('rgba(255, 164, 169, 0.8)', 'X', turn);
  } else {
    console.log("B")
    movePreLogic('rgba(255, 250, 164, 0.8)', 'O', turn)
  };
};

function movePreLogic(color, sign, turn){
  $('.boxes').hover(
    function(){
      if (!$(this).text()) {
        $(this).css({'background-color': color, 'cursor': 'pointer', 'color': color})
      } else {
        $(this).css({'cursor': 'initial'})
      }
    }, function(){
      $(this).css({'background-color': 'rgba(158, 177, 201, 0.4)', 'cursor': 'pointer'})
    }
  );
  $('.boxes').on('click', function(){
    $(this).text(sign)
    turn++;
    playerMove(turn);
  });
}