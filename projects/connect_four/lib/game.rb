require 'pry-byebug'

class Game
  def initialize
    @board = Array.new(6) { Array.new(7) }
    @round = 0
  end

  attr_reader :board
  attr_accessor :round

  def play
    loop do
      space = validate_input
      next if space.nil?

      place_color(space)
      display_board
      return puts 'You won!' if row_win?(space) || column_win?(space) || diagonal_win?(space)
      return puts "It's a tie!" if tie?

      self.round += 1
    end
  end

  def row_win?(space)
    row = board[space[0]]

    row.each_cons(4).any? { |cons| cons.all? { |e| e == board[space[0]][space[1]] } }
  end

  def column_win?(space)
    columns = get_down_rows(space)
    downwards = []

    columns.each { |column| downwards.push(column[space[1]]) }
    downwards.uniq.size <= 1
  end

  def get_down_rows(space)
    [board[space[0]], board[space[0] - 1], board[space[0] - 2], board[space[0] - 3]]
  end

  def diagonal_win?(space)
    return true if left_to_right_diagonal?(space)
    return true if right_to_left_diagonal?(space)

    false
  end

  def left_to_right_diagonal?(space)
    diagonal = []
    row = space[0]
    column = space[1]

    until board[row][column].nil?
      row -= 1
      column -= 1
    end

    until board[row].nil?
      diagonal.push(board[row][column]) unless row.negative?
      row += 1
      column += 1
    end

    diagonal.each_cons(4).any? { |cons| cons.all? { |e| e == board[space[0]][space[1]] } }
  end

  def right_to_left_diagonal?(space)
    diagonal = []
    row = space[0]
    column = space[1]

    until board[row][column].nil?
      row -= 1
      column += 1
    end

    until board[row].nil?
      diagonal.push(board[row][column]) unless row.negative?
      row += 1
      column -= 1
    end

    diagonal.each_cons(4).any? { |cons| cons.all? { |e| e == board[space[0]][space[1]]}}
  end

  def tie?
    last_row = board[5]
    last_row.none?(&:nil?)
  end

  def display_board
    puts "\n"

    col_numeration = 6

    board.reverse.each do |row|
      print "#{col_numeration}. |"
      row.each do |column|
        if column.nil?
          print "  #{column}   |"
        else
          print "  #{column}  |"
        end
      end
      puts "\n   -------------------------------------------"
      col_numeration -= 1
    end

    puts '      1.    2.    3.    4.    5.    6.    7.'
  end

  def place_color(space)
    return board[space[0]][space[1]] = 'r' if round.even? || round.zero?

    board[space[0]][space[1]] = 'y' if round.odd?
  end

  def validate_input
    puts 'Please select an empty space.'

    space = gets.chomp.split(',').map { |num| num.to_i - 1 }

    return if missing_input?(space)

    return if out_of_bounds?(space)

    return if occupied?(space)

    return if no_foundation?(space)

    space
  end

  def missing_input?(input)
    if input.nil? || input[1].nil?
      puts 'Cannot have empty values.'
      return true
    end

    false
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
