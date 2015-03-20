$(document).ready(function(){
  solutions = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]];
  avail_pos = [1,2,3,4,5,6,7,8,9]
  turn = 0;
  computer_selection = [];
  user_selection = [];

  game();
});

function game(){
  $('.boxes').hover(
    function(){
      if (!$(this).text()){
        $(this).css({'background-color': 'rgba(206, 212, 222, 0.6)', 'cursor': 'pointer'})
      };
    }, function(){
      $(this).css({'background-color': 'rgba(158, 169, 189, 0.6)', 'cursor': 'initial'})
    }
  );
  $('.boxes').on('click', function(){
    var pos = $(this).attr('id')
    var index = avail_pos.indexOf(Number(pos));
    if (turn % 2 === 0) {
      $(this).text("X");
      avail_pos.splice(index, 1)
      user_selection.push(Number(pos));
      turn++;
      if (user_selection.length > 2) {
        checkWinner(user_selection, "player");
      };
      $(this).off('click');
    };
    computerLogic();
  });
};

function computerLogic(){
  if (avail_pos.length > 0){
    var select = bestSelection();
    var index = avail_pos.indexOf(Number(select));
    $('#' + select).text("O").off('click');
    computer_selection.push(select);
    avail_pos.splice(index, 1)
    turn++;
    if (computer_selection.length > 2) {
      checkWinner(computer_selection, "computer");
    };
  };
};

function bestSelection(){
  var best_pick = 0;
  if (computer_selection.length < 1){
    if (avail_pos.indexOf(5) >= 0){
      return avail_pos[avail_pos.indexOf(5)];
    } else if (user_selection[0] === 5){
      return avail_pos[avail_pos.indexOf(1)];
    };
  } else {
    if (selectionLogic(computer_selection).length > 0) {
      console.log(best_pick)
      best_pick = Number(selectionLogic(computer_selection));
      return avail_pos[avail_pos.indexOf(best_pick)];
    } else if (selectionLogic(user_selection).length > 0) {
      best_pick = Number(selectionLogic(user_selection));
      console.log(best_pick)
      return avail_pos[avail_pos.indexOf(best_pick)];
    } else {
      return avail_pos[Math.floor(Math.random() * avail_pos.length)];
    };
  }
};

function checkWinner(selection, user){
  $(solutions).each(function(idx, e){
    if (selection.indexOf(e[0]) >= 0 && selection.indexOf(e[1]) >= 0 && selection.indexOf(e[2]) >= 0) {
      if (user === "player") {
        alert("You Win!");
        return false;
      } else {
        alert("Computer Wins!")
        return false;
      };
    } else {
      if (turn % 9 === 0) {
        alert("It is a Tie!")
        return false;
      };
    };
  });
};

function selectionLogic(selection){
  var select_picks = [];
  $(solutions).each(function(idx, e){
    if (selection.indexOf(e[0]) >= 0 && selection.indexOf(e[1]) >= 0) {
      if (avail_pos.indexOf(e[2]) >= 0) {
        select_picks.push(e[2]);
        return false;
      };
    } else if (selection.indexOf(e[0]) >= 0 && selection.indexOf(e[2]) >= 0) {
      if (avail_pos.indexOf(e[1]) >= 0) {
        select_picks.push(e[1]);
        return false;
      }
    } else if (selection.indexOf(e[1]) >= 0 && selection.indexOf(e[2]) >= 0) {
      if (avail_pos.indexOf(e[0]) >= 0) {
        select_picks.push(e[0]);
        return false;
      }
    };
  });
  return select_picks;
};


