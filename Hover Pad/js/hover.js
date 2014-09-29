$('#submit').on('click', createGrid);

// Saves user's input as a variable and generates grid
function createGrid(){
	$('#hoverpad').empty();
	var gridSize = document.getElementById('grid-size').value;
	
	if (gridSize > 100) {
		alert('Please pick a number between 1 ~ 100')
	};
	generateGrid(gridSize);
};

// Generates grid according to user input's gridSize
function generateGrid(gridSize){

	for (var i = 0; i < gridSize; i++) {
		for (var j = 0; j < gridSize; j++) {
			var box = $('<div class="box"></div>');
			var size = 700 / gridSize;
			box.css({'width': size, 'height': size})
			$('#hoverpad').append(box);
		}
	}
};	