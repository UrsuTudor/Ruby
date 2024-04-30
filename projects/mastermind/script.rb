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


