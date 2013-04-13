class Grid
  
  # For loops
  def new_grid(width, height, fill)
    @grid = []
    width.times do
      @grid << Array.new(height, fill)
    end
    @grid
  end

  # For blocks
  # def new_grid(height, width, fill)
  #   Array.new(width) { Array.new(height, fill) }
  # end
  
  # For the practice problem
  def print_grid
    system 'clear'

    puts "  " + [*0..(@grid.length-1)].join(" ") + " x"
    @grid.each_with_index { |a,i| puts "#{i} " + a.join(" ") }
    puts "y"
  end

  # lame use for yield. Could just be an argument
  def ask_for_x_y
    puts yield
    print "x: "
    x = gets.chomp.to_i
    print "y: "
    y = gets.chomp.to_i

    [x,y]
  end

end
