require_relative 'space'
require 'pry-byebug'

class Game
  def initialize
    @board = Array.new(6) { Array.new(7) }
    @round = 0
  end

  attr_reader :board
  attr_accessor :round

  def display_board
    board.each do |row|
      row.each do |column|
        if column.nil?
          print "  #{column}  |"
        else
          print "  #{column.player} |"
        end
      end
      puts "\n ----------------------------------"
    end
  end

  def place_color
    loop do
      space = validate_input
      next if space.nil?
      return board[space[0]][space[1]] = Space.new('r') if round.even? || round.zero?
      return board[space[0]][space[1]] = Space.new('y') if round.odd?
    end
  end

  def validate_input
    puts 'Please select an empty space.'

    space = gets.chomp.split(',').map { |num| num.to_i - 1 }

    return if out_of_bounds?(space)

    return if occupied?(space)

    return if no_foundation?(space)

    space
  end

  def out_of_bounds?(input)
    if input[0] > 5 || input[1] > 6
      puts 'The first number should be between 1 and 6, the second between 1 and 7.'
      return true
    end

    if input[0].negative? || input[1].negative?
      puts 'The first number should be between 1 and 6, the second between 1 and 7.'
      return true
    end

    false
  end

  def occupied?(input)
    return false if board[input[0]][input[1]].nil?

    puts 'That space is already occupied.'
    true
  end

  def no_foundation?(input)
    return false unless input[0].positive? && board[input[0] - 1][input[1]].nil?

    puts 'Please select a space with a foundation.'
    true
  end
end
