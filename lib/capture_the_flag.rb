require_relative 'grid'

class CaptureTheFlag < Grid

  def initialize(width = 10, height = 10)
    new_grid(width, height, 0)
    self.run
  end

  def run
    set_player_positions

    winner = false
    current_player = 1
    
    while (!winner) do
      self.print_grid
      guess = self.ask_for_x_y { "Player #{current_player}'s turn:" }

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

  # For excercise, just pass in position
  def set_player_positions
    self.print_grid

    xy = self.ask_for_x_y do
      "Player 1: Where would you like to place your flag?"
    end

    @player1_x = xy[0]
    @player1_y = xy[1]
    
    xy = self.ask_for_x_y do
      "Player 2: Where would you like to place your flag?"
    end

    @player2_x = xy[0]
    @player2_y = xy[1]
  end

  def show_answers
    @grid[@player1_y][@player1_x] = "!"
    @grid[@player2_y][@player2_x] = "!"
    self.print_grid
  end
end
