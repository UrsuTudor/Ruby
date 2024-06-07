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

  def place_color
    loop do
      puts 'Please select an empty space.'
      space = gets.chomp.split(',').map { |num| num.to_i - 1 }
      next puts 'That space is already occupied.' unless board[space[0]][space[1]].nil?

      return board[space[0]][space[1]] = Space.new('r') if round.even? || round.zero?
      return board[space[0]][space[1]] = Space.new('y') if round.odd?
    end
  end
end
