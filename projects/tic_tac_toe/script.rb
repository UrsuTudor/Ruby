require "pry-byebug"

# frozen_string_literal: true

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

  def empty?(index)
    self.display[index] == '   '
  end

  def none_empty?
    self.display.none? {|square| square == '   '}
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
    # handles round messages and gets player input
    if round_counter.even?
      puts "X, it's your turn! Choose a row and empty spot in which to place your mark!(row,spot)"
      player_choice = gets.chomp.split(',')
    end

    if round_counter.odd?
      puts "O, it's your turn! Choose a row and empty spot in which to place your mark!(row,spot)"
      player_choice = gets.chomp.split(',')
    end

    # declaring the working row requires less lines to handle the error message
    working_row = row1 if player_choice[0] == '1'
    working_row = row2 if player_choice[0] == '2'
    working_row = row3 if player_choice[0] == '3'

    next puts 'ERROR: choose an empty spot!' if player_choice[1] == '1' && !working_row.empty?(0)
    next puts 'ERROR: choose an empty spot!' if player_choice[1] == '2' && !working_row.empty?(2)
    next puts 'ERROR: choose an empty spot!' if player_choice[1] == '3' && !working_row.empty?(4)

    working_row.place_player_choice(player_choice[1].to_i, 'x') if round_counter.even?
    working_row.place_player_choice(player_choice[1].to_i, 'o') if round_counter.odd?

    # handles 'x' wins
    winner_declared = true if row1.display[0] == ' x ' && row1.display[2] == ' x ' && row1.display[4] == ' x '
    winner_declared = true if row2.display[0] == ' x ' && row2.display[2] == ' x ' && row2.display[4] == ' x '
    winner_declared = true if row3.display[0] == ' x ' && row3.display[2] == ' x ' && row3.display[4] == ' x '
    winner_declared = true if row1.display[0] == ' x ' && row2.display[0] == ' x ' && row3.display[0] == ' x '
    winner_declared = true if row1.display[4] == ' x ' && row2.display[4] == ' x ' && row3.display[4] == ' x '
    winner_declared = true if row1.display[0] == ' x ' && row2.display[2] == ' x ' && row3.display[4] == ' x '
    winner_declared = true if row1.display[4] == ' x ' && row2.display[2] == ' x ' && row3.display[0] == ' x '

    # handles 'o' wins 
    winner_declared = true if row1.display[0] == ' o ' && row1.display[2] == ' o ' && row1.display[4] == ' o '
    winner_declared = true if row2.display[0] == ' o ' && row2.display[2] == ' o ' && row2.display[4] == ' o '
    winner_declared = true if row3.display[0] == ' o ' && row3.display[2] == ' o ' && row3.display[4] == ' o '
    winner_declared = true if row1.display[0] == ' o ' && row2.display[0] == ' o ' && row3.display[0] == ' o '
    winner_declared = true if row1.display[4] == ' o ' && row2.display[4] == ' o ' && row3.display[4] == ' o '
    winner_declared = true if row1.display[0] == ' o ' && row2.display[2] == ' o ' && row3.display[4] == ' o '
    winner_declared = true if row1.display[4] == ' o ' && row2.display[2] == ' o ' && row3.display[0] == ' o '

    row1.display_row
    outline_row.display_row
    row2.display_row
    outline_row.display_row
    row3.display_row

    break puts 'This game is a draw!' if row1.none_empty? &&
                                         row2.none_empty? &&
                                         row3.none_empty?

    round_counter += 1
  end
end

play_game
