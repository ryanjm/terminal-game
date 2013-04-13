require_relative 'grid'

class BlocSweeper < Grid

  def initialize(width = 5, bombs = 10)
    new_grid(width, width, "X")
    # set flag
    @flag = new_position(width)
    # set bombs
    @blocs = []
    self.create_blocs( bombs, width )
    self.run
  end

  def create_blocs(num, width)
    num.to_i.times do
      @blocs << new_position(width)
    end
  end

  def new_position(max)
    [rand(max), rand(max)]
  end

  def run
    correct = false
    @lives = 10

    while (!correct && @lives > 0) do
      self.print_grid
      puts "You have #{@lives} lives."
      guess = self.ask_for_x_y { "What is your guess?" }
      correct = self.make_guess(guess)    
    end
    
    if correct
      puts "You won!"
    else
      puts "Sorry, you lost"
    end
  end

  def make_guess(guess)
    if guess == @flag
      @grid[guess[1]][guess[0]] = "!"
      true
    elsif is_bomb?(guess)
      @lives -= 1
      @grid[guess[1]][guess[0]] = "*"
      false
    else
      @grid[guess[1]][guess[0]] = " "
      false
    end
  end

  def is_bomb?(guess)
    @blocs.index {|b| b == guess }
  end
end
