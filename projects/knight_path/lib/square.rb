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

  def knight_moves(position, final, queue = [], initial_pos = nil)
    # makes it easier to remember the initial position on each iteration
    # we keept it because it is needed later for the find_path method
    if queue.empty?
      initial_pos = position
      position = Square.new(position)
    end

    if position.coords == final
      path = find_path(position, initial_pos)

      puts "You made it in #{path.length - 1} moves! This was your path:"
      return path.each { |coord| p coord }
    end

    queue.shift

    position.find_possible_paths(position)
    position.possible_paths.each do |path|
      queue.push(path)
    end

    knight_moves(queue[0], final, queue, initial_pos)
  end

  def find_path(position, initial_pos, history = [])
    if position.coords == initial_pos
      history.push(initial_pos)
      return history.reverse
    end

    history.push(position.coords)

    find_path(position.visited_from, initial_pos, history)
  end
end
