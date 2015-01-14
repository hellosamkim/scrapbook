class Rover
  COMPASS = %w[N E S W]
  def grid
    print "Please enter the size of Mars (eg 4 x 5): "
    @grid_size = gets.chomp.gsub(/x/, "").split(" ")
    @grid_x = @grid_size[0]
    @grid_y = @grid_size[1]
    deploy_rovers
  end

  def intro
    system "clear" 
    print "Please Enter How Many Rovers You'd Like to Deploy: "
    @rover_amount = gets.chomp.to_i
    print "Getting Ready to Deploy #{@rover_amount}"
    if @rover_amount < 2
      puts " Rover"
      grid
    else
      puts " Rovers"
      grid
    end
  end

  def deploy_rovers
    @rovers_deployed = {}
    @rover_intervals = 1
    @rover_amount.times do 
      print "Please enter Rover #{@rover_intervals}'s position (eg 4 5 N): "
      @rover_pos = gets.chomp.split(" ")
      @rover_pos_x = @rover_pos[0]
      @rover_pos_y = @rover_pos[1]
      @rover_direction = @rover_pos[2]
      @rovers_deployed[:"#{@rover_intervals}"] = [@rover_pos_x.to_i, @rover_pos_y.to_i, @rover_direction.upcase]
      @rover_intervals += 1
    end
    deployed_rovers
  end

  def display_rovers
    system "clear"
    puts "..: Deployed Rovers :.."
    @rovers_deployed.each do |rover, deployed|
      puts "Rover ID ##{rover}.  Pos-X: #{deployed[0]}  Pos-Y: #{deployed[1]}  Facing: #{deployed[2]}"
    end
    print_menu
  end

  def deployed_rovers
    display_rovers
  end

  def error_rovers
    puts ""
    puts "ALERT. ALERT. ALERT. ALERT"
    puts "ERROR. ERROR. ERROR. ERROR"
    puts "Your Rovers have Landed on the same spot. Please Move the Rover."
    move_rover2
  end


  def print_menu
    puts ""
    puts "    -Menu-                            -Legend-"
    puts "[1] Move Rover                        L : Left"
    puts "[2] Add Rover                         R : Right"
    puts "[3] Remove Rover                      M : Move"
    puts "[4] Quit Mars Rover                           "
    print "Please Select one of the options: "
    user_input = gets.chomp.to_i
    case user_input
    when 1
      move_rover
    when 2
      add_rover
    when 3
      remove_rover
    when 4
      splat_screen
    else
      puts "Please enter a valid option"
      sleep(0.2)
      display_rovers
    end
  end

  def move_rover
    print "Please select which Rover to move: "
    @rover_select = gets.chomp.to_i
    move_rover2
  end

  def move_rover2
    puts "Please enter the moves for this Rover (eg LRLRLRMMMRLM): "
    rover_moves = gets.chomp.upcase.split("")

    @rover_facing = @rovers_deployed.fetch(:"#{@rover_select}")[2]
    @rover_compass = COMPASS.index(@rover_facing)
    @rover_x = @rovers_deployed.fetch(:"#{@rover_select}")[0]
    @rover_y = @rovers_deployed.fetch(:"#{@rover_select}")[1]
    rover_moves.each do |rover_move|
      unless rover_move == "M"
        rotate(rover_move)
      else
        move(rover_move)
      end
    end
    update_rover(@rover_facing, @rover_x, @rover_y)
  end

  def rotate(rover_move)
    if rover_move == "L"
      @rover_compass = COMPASS.index(@rover_facing) - 1
      if @rover_compass < 0
        @rover_compass = 3
      end
    else
      @rover_compass = COMPASS.index(@rover_facing) + 1
      if @rover_compass > 3
        @rover_compass = 0
      end
    end 
    @rover_facing = COMPASS.fetch(@rover_compass)
  end

  def move(rover_move)
    case @rover_facing
    when "N"
      @rover_y += 1
    when "E"
      @rover_x += 1
    when "S"
      @rover_y -= 1
    else
      @rover_x -= 1
    end
  end

  def update_rover(direction, x, y)
    @rovers_deployed[:"#{@rover_select}"] = [x, y, direction]
    @rovers_deployed.each do |rover, deployed|
      next if rover.to_s.to_i == @rover_select
      if deployed[0] == x && deployed[1] == y
        error_rovers
      else
        display_rovers
      end
    end 
  end

  def add_rover
    print "Please enter Rover #{@rover_intervals}'s position (eg 4 5 N): "
    @rover_pos = gets.chomp.split(" ")
    @rover_pos_x = @rover_pos[0]
    @rover_pos_y = @rover_pos[1]
    @rover_direction = @rover_pos[2]
    @rovers_deployed[:"#{@rover_intervals}"] = [@rover_pos_x.to_i, @rover_pos_y.to_i, @rover_direction.upcase]
    @rover_intervals += 1
    display_rovers
  end

  def remove_rover
    print "Please enter the Rover ID you would like to remove: "
    remove_rover = gets.chomp.to_i
    @rovers_deployed.delete(:"#{remove_rover}")
    display_rovers
  end

  def splat_screen
  puts "   _____ _                 _    _        __                       _                                "
  puts "  |_   _| |               | |  ( )      / _|                     (_)                               "
  puts "    | | | |__   __ _ _ __ | | _|/ ___  | |_ ___  _ __   _   _ ___ _ _ __   __ _                    "
  puts "    | | | '_ \ / _` | '_ \| |/ / / __| |  _/ _ \| '__| | | | / __| | '_ \ / _` |                   "
  puts "    | | | | | | (_| | | | |   <  \__ \ | || (_) | |    | |_| \__ \ | | | | (_| |                   "
  puts "    \_/ |_| |_|\__,_|_| |_|_|\_\ |___/ |_| \___/|_|     \__,_|___/_|_| |_|\__, |                   "
  puts "                                                                           __/ |                   "
  puts "                                                                          |___/                    "
  puts "                                                         _____                   _   ___           "
  puts "                                                        /  ___|                 | | / (_)          "
  puts "                                                ______  \ `--.  __ _ _ __ ___   | |/ / _ _ __ ___  "
  puts "                                               |______|  `--. \/ _` | '_ ` _ \  |    \| | '_ ` _ \ "
  puts "                                                        /\__/ / (_| | | | | | | | |\  \ | | | | | |"
  puts "                                                        \____/ \__,_|_| |_| |_| \_| \_/_|_| |_| |_|"
  end
end

rover1 = Rover.new
rover1.intro