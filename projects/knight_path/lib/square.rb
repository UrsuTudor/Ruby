class Square
  def initialize(coords)
    @coords = coords
    @possible_knight_paths
  end
  attr_reader :coords

  def find_paths(coords = self.coords)
    paths = []
    x = coords[0]
    y = coords[1]

    paths.push([x - 2, y + 1])
    paths.push([x - 1, y + 2])
    paths.push([x + 1, y + 2])
    paths.push([x + 2, y + 1])

    paths.push([x - 2, y - 1])
    paths.push([x - 1, y - 2])
    paths.push([x + 1, y - 2])
    paths.push([x + 2, y - 1])

    paths.delete_if do |path|
      path[0] > 7 ||
        path[1] > 7 ||
        path[0].negative? ||
        path[1].negative?
    end

    paths
  end
end
