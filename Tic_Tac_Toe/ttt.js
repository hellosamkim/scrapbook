$(document).ready(function(){
  var SOLUTIONS = ["1,2,3", "4,5,6", "7,8,9", "1,4,7", "2,5,8", "3,6,9", "1,5,9", "3,5,7"];
  AVAIL_POS = [1,2,3,4,5,6,7,8,9]
  turn = 0;
  computer_selection = [];
  user_selection = [];

  game();
});

function game(){

  $('.boxes').hover(
    function() {
      if (!$(this).text()){
        $(this).css({'background-color': 'rgba(206, 212, 222, 0.6)'})
      };
    }, function(){
      $(this).css({'background-color': 'rgba(158, 169, 189, 0.6)'})
    }
  );
  $('.boxes').on('click', function(){
    var pos = $(this).attr('id')
    var index = AVAIL_POS.indexOf(Number(pos));
    if (turn % 2 === 0) {
      $(this).text("X");
      AVAIL_POS.splice(index, 1)
      turn++;
      $(this).off('click');
    };
    computerSelection();
  });
};

function computerSelection(){
  if (AVAIL_POS.length > 0) {
    var select = AVAIL_POS[Math.floor(Math.random() * AVAIL_POS.length)];
    var index = AVAIL_POS.indexOf(Number(select));
    $('#' + select).text("O").off('click');
    computer_selection.push(select);
    console.log(computer_selection);
    AVAIL_POS.splice(index, 1)
    turn++;
  }
};



