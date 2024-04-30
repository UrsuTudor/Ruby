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

board = Board.new

board.display_game_board

cp = ComputerPlayer.new

cp.generate_code
