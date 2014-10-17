class Grid
	def initialize(max_x, max_y)
		@max_x = max_x
		@max_y = max_y
	end
end

class Rover
	def initialize(x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end

	def to_s 
		puts "The Rover is current at (#{@x}, #{@y}) facing " + @direction
	end

	def rotation(rotatedarover)

	end

	def movement(movedarover)
		 
	end

	def direct
		print "Direct your Rover! (ex: LMLMRMMMLM): "
		direct = gets.chomp
		moves = direct.capitalize.split("")

		moves.each do |move|
			case move
			when "L", "R"
				rotation(move)
			when "M"
				movement(move)
			end
		end
	end
end

class RoverGame
	print "Please enter the max X coordinate: "
	max_x = gets.chomp
	print "Please enter the max Y coordinate: "
	max_y = gets.chomp
	Grid.new(max_x, max_y)
	print "Please enter where you'd like to place your Rover (ex: 4 5 N): "
	positions = gets.chomp
	position = positions.capitalize.split(' ')
	rov1 = Rover.new(position[0],position[1],position[2])
	rov1.direct
end

RoverGame.new

