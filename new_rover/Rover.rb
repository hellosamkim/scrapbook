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
    x = 1
    @rover_amount.times do 
      print "Please enter Rover #{x}'s position (eg 4 5 N): "
      @rover_pos = gets.chomp.split(" ")
      @rover_pos_x = @rover_pos[0]
      @rover_pos_y = @rover_pos[1]
      @rover_direction = @rover_pos[2]
      @rovers_deployed[:"#{x}"] = [@rover_pos_x.to_i, @rover_pos_y.to_i, @rover_direction.upcase]
      x += 1
    end
    deployed_rovers
  end

  def deployed_rovers
    system "clear"
    puts "..: Deployed Rovers :.."
    @rovers_deployed.each do |rover, deployed|
      puts "Rover #{rover}.  Pos-X: #{deployed[0]}  Pos-Y: #{deployed[1]}  Facing: #{deployed[2]}"
    end
    print_menu
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
    else
      splat_screen
    end
  end

  def move_rover
    print "Please select which Rover to move: "
    @rover_select = gets.chomp.to_i
    puts "Please enter the moves for this Rover (eg LRLRLRMMMRLM): "
    rover_moves = gets.chomp.upcase.split("")

    @rover_facing = @rovers_deployed.fetch(:"#{@rover_select}")[2]
    @rover_compass = COMPASS.index(@rover_facing)
    rover_moves.each do |rover_move|
      unless rover_move == "M"
        rotate(rover_move)
      else
        move(rover_move)
      end
    end
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
    puts @rover_facing
  end 

  def move(rover_move)

  end

  def add_rover
    
  end

  def remove_rover
    
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