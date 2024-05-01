# frozen_string_literal:true

require "pry-byebug"

class Board
  def initialize
    @game_board = Array.new(8) { Array.new(4, '      ') }
  end
  attr_reader :game_board

  def display_game_board
    row_number = 0
    game_board.each do |row|
      print "#{row_number += 1}."
      puts row.join('|')
      puts '  ---------------------------'
    end
  end
end

class ComputerPlayer
  def initialize
    @colors = %w[red blue yellow green]
  end
  attr_reader :colors

  def generate_code
    computer_code = []
    4.times { computer_code.push(colors[rand(0..3)]) }
    p computer_code
  end
end

class HumanPlayer
  def player_guess
    puts 'Take a guess! The colors are: red, blue, yellow and green.'
    player_guess = gets.chomp.split
  end
end

class Game 
  def initialize
    @board = Board.new
    @board.display_game_board
    @computer = ComputerPlayer.new
    @computer_code = computer.generate_code
    @player = HumanPlayer.new
    @player_guess
    @winner = false
    @round_count = 0
  end

  def play
    while winner == false
      puts ' '
      @player_guess = player.player_guess
      update_board
      compare_codes
      winner?
      break if loss?
    end
  end

  private

  attr_reader :board, :computer, :player, :computer_code
  attr_accessor :player_guess, :winner, :round_count

  def compare_codes
    computer_code.each_with_index do |color, color_index|
      player_guess.each do |guess|
        # exact spot
        if guess == color && computer_code[color_index] == player_guess[color_index]
          p "#{guess.upcase} from column #{color_index + 1} is in the right spot!"
          break
        end

        # right color, wrong spot
        if guess == color && computer_code[color_index] != player_guess[color_index]
          p "There is one/one more instance of the color #{guess.upcase}, but in a different column!"
          break
        end
      end
    end
  end

  def winner?
    return unless player_guess == computer_code

    self.winner = true
    p 'Congratulations, you cracked the code!'
  end

  def loss?
    return unless round_count == 8 && winner == false

    p 'You did not manage to crack the code in 8 rounds. Better luck next time!'
    true
  end

  def update_board
    updated_row = []

    player_guess.each do |cell|
      cell += ' ' until cell.length == 6
      updated_row.push(cell)
    end

    board.game_board[round_count] = updated_row
    board.display_game_board

    self.round_count += 1
  end
end

Game.new.play
