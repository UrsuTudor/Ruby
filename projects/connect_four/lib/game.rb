require_relative 'space'

class Game
  def initialize
    @board = Array.new(6) { Array.new(7) }
    @round = 0
  end

  attr_reader :board
  attr_accessor :round

  def display_board
    puts ''
    board.each do |row|
      row.each do |column|
        print "  #{column}  |"
      end
      puts "\n ----------------------------------"
    end
  end

  def place_color(row, col)
    return 'That space is already occupied.' unless board[row - 1][col - 1].nil?

    board[row - 1][col - 1] = Space.new('r') if round.even? || round.zero?
    board[row - 1][col - 1] = Space.new('y') if round.odd?
  end
end
