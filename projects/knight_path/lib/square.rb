require 'pry-byebug'

class Square
  def initialize(coords, visited_from = nil)
    @coords = coords
    @possible_paths = []
    @visited_from = visited_from
  end

  attr_accessor :possible_paths, :visited_from, :coords

  def find_possible_paths(square)
    possible_paths = []
    possible_paths.push(
      # upwards
      [coords[0] + 1, coords[1] + 2],
      [coords[0] - 1, coords[1] + 2],
      [coords[0] + 2, coords[1] + 1],
      [coords[0] - 2, coords[1] + 1],
      # downwards
      [coords[0] + 1, coords[1] - 2],
      [coords[0] - 1, coords[1] - 2],
      [coords[0] + 2, coords[1] - 1],
      [coords[0] - 2, coords[1] - 1]
    )

    # removes paths that would be out of the board
    possible_paths = possible_paths.delete_if do |path|
      !path[0].between?(0, 7) && !path[1].between?(0, 7)
    end

    self.possible_paths = possible_paths.map do |path|
      Square.new(path, square)
    end
  end
end
