class Rover
  def grid
    print "Please enter the size of Mars (eg 4 x 5): "
    @grid_size = gets.chomp
    @grid_x = @grid_size.slice(0,1)
    @grid_y = @grid_size.slice(4,1)
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
    deployed_rovers = []
    x = 1
    @rover_amount.times do 
      print "Please enter Rover #{x}'s position (eg 4 5 N): "
      rover_pos = gets.chomp.split(" ")
      rover_pos_x = rover_pos[0]
      rover_pos_y = rover_pos[1]
      rover_direction = rover_pos[2]
      deployed_rovers << [x,rover_pos_x.to_i,rover_pos_y.to_i,rover_direction.upcase]
      x += 1
    end
    deployed_rovers.each do |deployed_rover|
      print deployed_rover
    end
  end
end

rover1 = Rover.new
rover1.intro