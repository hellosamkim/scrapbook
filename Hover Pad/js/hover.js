// Creates Grid
$('form').submit(hoverSetup);

// Hover Pad's main setup
function hoverSetup(){
	$('.hoverpad').empty();
	var gridSize = document.getElementById('grid-size').value;
	
	if (gridSize > 50) {
		alert('Please pick a number between 1 ~ 50')
	};

	generateGrid(gridSize);
  colourPad();
};

// Generates grid according to user input's gridSize
function generateGrid(gridSize){
	var size = (550/ gridSize) + "px";
	for (var i = 0; i < gridSize; i++) {
		var rows = $('<div class="rows"></div>');
		rows.css({
			'width': 550,
			'height': size,
			'margin': '0px',
      'display': 'block'
		});
		$('.hoverpad').append(rows)

		for (var j = 0; j < gridSize; j++) {
			var boxes = $('<div class="boxes"></div>')
			boxes.css({
				'width': size,
				'height': size,
        'background-color': 'white',
				'display': 'inline-block',
        'margin': 0,
        'padding': 0
			});
			rows.append(boxes)
		}
	};
  $('.boxes').mouseover(function() {
      $(this).css('background-color', 'black')
  });
};	

// Gives users option to pick and switch colours of their choice
function colourPad(){
  $('#black').on("click", function(){
    $('.boxes').mouseover(function() {
      $(this).css('background-color', 'black')
    });
  });
  $('#red').on("click", function(){
    $('.boxes').mouseover(function() {
      $(this).css('background-color', 'red')
    });
  });
  $('#blue').on("click", function(){
    $('.boxes').mouseover(function() {
      $(this).css('background-color', 'blue')
    });
  });
  $('#yellow').on("click", function(){
    $('.boxes').mouseover(function() {
      $(this).css('background-color', 'yellow')
    });
  });
};







