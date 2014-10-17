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

	def direction_output(direction)
		case direction
		when "N"
			puts "North"
		when "E"
			puts "East"
		when "S"
			puts "South"
		else
			puts "West"
		end
	end

	def to_s 
		puts "The Rover is current at (#{@x}, #{@y}) facing " + @direction.capitalize
	end
end

class RoverStart
	print "Please enter the max X coordinate: "
	max_x = gets.chomp
	print "Please enter the max Y coordinate: "
	max_y = gets.chomp
	Grid.new(max_x, max_y)
	print "Please enter where you'd like to place your Rover (ex: 4 5 N): "
	positions = gets.chomp
	position = positions.split(' ')
	rov1 = Rover.new(position[0],position[1],position[2])
	puts rov1
end

RoverStart.new

