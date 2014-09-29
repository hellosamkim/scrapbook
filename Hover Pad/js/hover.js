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
	var size = 700/ gridSize;
	for (var i = 0; i < gridSize; i++) {
		var row = $('<div class="row"></div>');
		row.css({
			'width': 700,
			'height': size,
			'margin': '0px'
		});
		$('#hoverpad').append(row);

		
	}
};	



		// for (var j = 0; j < gridSize; j++) {
		// 	var box = $('<div class="box"></div>');
		// 	box.css({'width': size, 'height': size})
		// 	$('#hoverpad').append(box);
		// }