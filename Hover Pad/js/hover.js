$('#submit').on('click', createGrid);

// Saves user's input as a variable and generates grid
function createGrid(){
	$('#grid').empty();
	var gridSize = document.getElementById('grid-size').value;
	
	if (gridSize > 50) {
		alert('Please pick a number between 1 ~ 50')
	};
	generateGrid(gridSize);
};

// Generates grid according to user input's gridSize
function generateGrid(gridSize){
	$('#grid').append('hi')
};
