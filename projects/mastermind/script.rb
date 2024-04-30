# frozen_string_literal:true

class Board
  def initialize
    @game_board = Array.new(8) { Array.new(4, '   ') }
  end
  attr_reader :game_board

  def display_game_board
    row_number = 0
    game_board.each do |row|
      print "#{row_number += 1}."
      puts row.join('|')
      puts '  ---+---+---+---'
    end
  end
end

class ComputerPlayer
  def initialize
    @colors = %w[red blue yellow green]
  end
  attr_reader :colors

  def generate_code
    code = []
    4.times do
      code.push(colors[rand(0..3)])
    end

    p code
  end
end

class HumanPlayer
  def get_player_code
    puts "Take a guess!"
    p player_code = gets.chomp
    player_code
  end
end

class Game 
  def initialize
    @board = Board.new 
    @computer = ComputerPlayer.new
    @player = HumanPlayer.new
  end

  attr_reader :board, :computer, :player

  def play
    board.display_game_board
    computer.generate_code
    player.get_player_code
  end
end

Game.new.play

# need to make player algorhitm that allows player to select code
# get player choice
# check player choice, update row and give feedback
# move on to row 2, probably with a loop on the rows or an i+ that changes board[i] to hop on the next row with the update
