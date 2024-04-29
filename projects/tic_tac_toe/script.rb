require "pry-byebug"

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

  # private

  attr_reader :display
end

# class of rows that can contain 'x' or 'o'
class GameRow < Rows
  def place_player_choice(index, choice)
    if index > 4
      p 'ERROR: choose a number between 1 and 3'
      return
    end

    # necessary because 1 and 3 are the indexes of the outline bars
    index = 0 if index == 1
    index = 4 if index == 3

    if choice != 'x' && choice != 'o'
      p "ERROR: your choice must be 'x' or 'o'"
      return
    end

    self.display[index] = " #{choice} "
  end
end

# class of outlines that cannot and should not be modified by the player
class OutlineRow < Rows
end

def play_game
  winner_declared = false
  round_counter = 0

  outline_row = OutlineRow.new(['---', '+', '---', '+', '---'])
  row1 = GameRow.new(['   ', '|', '   ', '|', '   '])
  row2 = GameRow.new(['   ', '|', '   ', '|', '   '])
  row3 = GameRow.new(['   ', '|', '   ', '|', '   '])

  until winner_declared == true
    if round_counter.even?
      puts "X, it's your turn! Choose a row and empty spot in which to place your mark!(row, spot)"
      player_choice = gets.chomp.split(',')

      working_row = row1 if player_choice[0] == '1'
      working_row = row2 if player_choice[0] == '2'
      working_row = row3 if player_choice[0] == '3'

      # prevents replacement of symbols
      next puts 'ERROR: choose an empty spot!' if player_choice[1] == '1' && working_row.display[0] != '   '
      next puts 'ERROR: choose an empty spot!' if player_choice[1] == '2' && working_row.display[2] != '   '
      next puts 'ERROR: choose an empty spot!' if player_choice[1] == '3' && working_row.display[4] != '   '

      working_row.place_player_choice(player_choice[1].to_i, 'x')
    end

    if round_counter.odd?
      puts "O, it's your turn! Choose a row and empty spot in which to place your mark!(row, spot)"
      player_choice = gets.chomp.split(',')

      working_row = row1 if player_choice[0] == '1'
      working_row = row2 if player_choice[0] == '2'
      working_row = row3 if player_choice[0] == '3'

      next puts 'ERROR: choose an empty spot!' if player_choice[1] == '1' && working_row.display[0] != '   '
      next puts 'ERROR: choose an empty spot!' if player_choice[1] == '2' && working_row.display[2] != '   '
      next puts 'ERROR: choose an empty spot!' if player_choice[1] == '3' && working_row.display[4] != '   '

      working_row.place_player_choice(player_choice[1].to_i, 'o')
    end

    row1.display_row
    outline_row.display_row
    row2.display_row
    outline_row.display_row
    row3.display_row

    round_counter += 1
  end
end

play_game
