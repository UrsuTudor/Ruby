class Board
  def initialize
    @board = build_board
  end

  def build_board(board = [], x_axis = 0, y_axis = 0)
    return board if y_axis > 7

    8.times do
      board.push(Square.new([x_axis, y_axis]))

      x_axis += 1
    end

    build_board(board, 0, y_axis + 1)
  end
end
