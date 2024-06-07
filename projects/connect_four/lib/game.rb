class Game
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  attr_reader :board

  def display_board
    puts ''
    board.each do |row|
      row.each do |column|
        print "  #{column}  |"
      end
      puts "\n ----------------------------------"
    end
  end
end
