# frozen_string_literal: true

# need to display an empty board
# need player 1 for "x" and 2 for "o"
# need player 1 and 2 to be able to change the board display
# need plyer 1 and 2 to be able to track the changes they have made to the board
# make player 1 and 2 win when certain conditions are met and reset the board

# parent of all the rows in the game
class Rows
  def initialize(array)
    @display = array
  end

  def display_row
    puts display.join
  end

  private

  attr_reader :display
end

# class of rows that can contain 'x' or 'o'
class GameRow < Rows
end

# class of outlines that cannot and should not be modified by the player
class OutlineRow < Rows
end

outline_row = OutlineRow.new(['---', '+', '---', '+', '---'])
row1 = GameRow.new(['   ', '|', '   ', '|', '   '])
row2 = GameRow.new(['   ', '|', '   ', '|', '   '])
row3 = GameRow.new(['   ', '|', '   ', '|', '   '])

row1.display_row
outline_row.display_row
row2.display_row
outline_row.display_row
row3.display_row
