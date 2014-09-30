// Creates Grid
$('form').submit(createGrid);

// Saves user's input as a variable and generates grid
function createGrid(){
	$('.hoverpad').empty();
	var gridSize = document.getElementById('grid-size').value;
	
	if (gridSize > 100) {
		alert('Please pick a number between 1 ~ 100')
	};
	generateGrid(gridSize);
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
        'background-color': 'red',
				'display': 'inline-block',
        'margin': 0,
        'padding': 0
			});
			rows.append(boxes)
		}
	};
};	

