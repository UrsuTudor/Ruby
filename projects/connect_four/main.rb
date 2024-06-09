require_relative 'lib/game'

game = Game.new
game.place_color
game.display_board

# How do you check if there are 4 connected dots
  # could use a graph where each dot remembers its neighbour
    # when a dot is placed, check the spaces around it
    # if there is a neighbour of the same color, save it as an ancestor for that direction
    # once all directions have been checked, start a search that goes along the ancestors of the same direction
    # if it goes through 4 loops, declare a winner
