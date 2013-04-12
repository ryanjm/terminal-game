require_relative 'grid'

class CaptureTheFlag < Grid

  def initialize(width = 10, height = 10)
    new_grid(width, height, 0)
    self.run
  end

  def run
    # Get players positions
    set_player_positions
    # Go through turns
    winner = false
    current_player = 1
    while (!winner) do
    #   print grid
      self.print_grid
    #   Ask for guess
      guess = self.ask_for_guess(current_player)
    #   Check if winner
      if is_winner?(guess, current_player)
        winner = current_player
      else
        @grid[guess[1]][guess[0]] = current_player
        current_player = current_player == 1 ? 2 : 1
      end
    end

    show_answers
    puts "Player #{winner} won!\n\n"
    
  end

  def is_winner?(guess, current_player)
    if current_player == 1
      guess[0] == @player2_x && guess[1] == @player2_y
    else
      guess[0] == @player1_x && guess[1] == @player1_y
    end
  end

  def ask_for_guess(player)
    puts "Player #{player}'s turn:"
    print "x: "
    x = gets.chomp.to_i
    print "y: "
    y = gets.chomp.to_i

    [x,y]
  end
  
  # For excercise, just pass in position
  def set_player_positions
    self.print_grid

    puts "Player 1: Where would you like to place your flag?"
    print "x: "
    @player1_x = gets.chomp.to_i
    print "y: "
    @player1_y = gets.chomp.to_i
    
    puts "\nPlayer 2: Where would you like to place your flag?"
    print "x: "
    @player2_x = gets.chomp.to_i
    print "y: "
    @player2_y = gets.chomp.to_i
  end

  def show_answers
    @grid[@player1_y][@player1_x] = "!"
    @grid[@player2_y][@player2_x] = "!"
    self.print_grid
  end
end
