require_relative 'lib/square'

square = Square.new([5, 7])
square.find_possible_paths(square)
square.knight_moves([5, 7], [0, 0])
