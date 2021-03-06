class Rover
	attr_reader :x, :y, :x_max, :y_max, :direction
	
  COMPASS = %w[N E S W]
	def initialize(x, y, x_max, y_max, direction)
		@x = x
		@y = y
		@x_max = x_max
		@y_max = y_max
		@direction = direction
	end

	def display
		if @x > @x_max || @y > @y_max
			puts "I'm sorry, but your Rover has fallen out of grid..."
		else
			puts "The Rover is current at (#{@x}, #{@y}) facing " + compass(@direction)
		end
	end

	def rotation(rotatedarover)
    if rotatedarover == "L"
      @compass_direction = COMPASS.index(@direction) - 1
     	if @compass_direction == -1
     		@compass_direction = 3
     	end
      @direction = COMPASS.fetch(@compass_direction)

    elsif rotatedarover == "R"
      @compass_direction = COMPASS.index(@direction) + 1
     	if @compass_direction == 4
     		@compass_direction = 0
     	end
      @direction = COMPASS.fetch(@compass_direction)
    end
	end

	def movement(movedarover)
		case @direction
		when "N"
			@y += 1
		when "E"
			@x += 1
		when "S"
			@y -= 1
		else
			@x -= 1
		end
	end

	def direct
		print "Direct your Rover! (ex: LMLMRMMMLM): "
		direct = gets.chomp.upcase!
		moves = direct.split("")

		moves.each do |move|
			if move == "L" || move == "R"
				rotation(move)
			else
				movement(move)
			end
		end
	end

	def compass(direction)
		case direction
		when "N"
			"North"
		when "E"
			"East"
		when "S"
			"South"
		else
			"West"
		end
	end
end

class RoverGame
	print "Please enter the max X coordinate: "
	max_x = gets.chomp
	print "Please enter the max Y coordinate: "
	max_y = gets.chomp
	print "Please enter where you'd like to place your Rover (ex: 4 5 N): "
	positions = gets.chomp
	position = positions.split(' ')
	rov1 = Rover.new(position[0].to_i, position[1].to_i, max_x.to_i, max_y.to_i, position[2].capitalize!)
	rov1.direct
	puts rov1.display
end

RoverGame.new

