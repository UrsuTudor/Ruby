# frozen_string_literal:true

require "pry-byebug"

class Board
  def initialize
    @game_board = Array.new(8) { Array.new(4, '      ') }
  end
  attr_reader :game_board

  def display_game_board
    row_number = 0
    game_board.each do |row|
      print "#{row_number += 1}."
      puts row.join('|')
      puts '  ---------------------------'
    end
  end
end

class ComputerPlayer
  def initialize
    @colors = %w[red blue yellow green]
    @guess = []
    @guess_count = 0
  end
  attr_reader :colors
  attr_accessor :guess, :guess_count

  def generate_code
    computer_code = []
    4.times { computer_code.push(colors[rand(0..3)]) }
    computer_code
  end

  def set_computer_guess
    4.times { guess.push(colors[rand(0..3)]) } if guess_count.zero?
    self.guess = guess.shuffle if guess_count > 1
    self.guess_count += 1
  end
end

class HumanPlayer
  def initialize
    @guess
    @player_code
  end

  attr_accessor :guess, :player_code

  def player_guess
    puts 'Take a guess! The colors are: red, blue, yellow and green.'
    self.guess = gets.chomp.split
  end

  def set_player_code
    puts 'Set your code! The colors you can choose are: red, blue, yellow and green.'
    self.player_code = gets.split
    p player_code
  end
end

class Game 
  def initialize
    @board = Board.new
    @board.display_game_board
    @computer = ComputerPlayer.new
    @computer_code = computer.generate_code
    @player = HumanPlayer.new
    @winner = false
    @round_count = 0
    @gamemode
  end

  def play
    choose_gamemode
    if gamemode == 1
      while winner == false
        puts ' '
        player.guess = player.player_guess
        update_board
        compare_codes
        winner?
        break if loss?
      end
    elsif gamemode == 2
      player.set_player_code

      while winner == false
        computer.set_computer_guess
        update_board
        compare_codes
        winner?
        break if loss?
      end
    end
  end

  def choose_gamemode
    puts "Choose gamemode: type 1 if you want to guess the computer's code or 2 if you want the computer to guess your code."
    self.gamemode = gets.chomp.to_i
  end

  private

  attr_reader :board, :computer, :player, :computer_code
  attr_accessor :player_guess, :winner, :round_count, :gamemode

  def compare_codes
    shuffled_messages = []
    code_to_guess = []
    guesses = []

    if gamemode == 1
      code_to_guess = computer_code
      guesses = player.guess
    end

    if gamemode == 2
      code_to_guess = player.player_code
      guesses = computer.guess
    end

    code_to_guess.each_with_index do |color, color_index|
      guesses.each do |guess|
        # exact spot
        if guess == color && code_to_guess[color_index] == guesses[color_index]
          shuffled_messages.push("#{guess.upcase} from column #{color_index + 1} is in the right spot!")
          break
        end

        # right color, wrong spot
        if guess == color && code_to_guess[color_index] != guesses[color_index]
          # p "There is one/one more instance of the color #{guess.upcase}, but in a different column!"
          shuffled_messages.push("The color #{guess.upcase} is right, but there is one/one more of that color in a different spot!")
          break
        end
      end
    end

    shuffled_messages.shuffle.each do |message|
      puts message
    end
  end

  def winner?
    code_to_guess = []
    guesses = []

    if gamemode == 1
      code_to_guess = computer_code
      guesses = player.guess
    end

    if gamemode == 2
      code_to_guess = player.player_code
      guesses = computer.guess
    end

    return unless guesses == code_to_guess

    self.winner = true
    p 'Congratulations, you cracked the code!'
  end

  def loss?
    return unless round_count == 8 && winner == false

    p 'You did not manage to crack the code in 8 rounds. Better luck next time!'
    true
  end

  def update_board
    updated_row = []

    if gamemode == 1
      code_to_guess = computer_code
      guesses = player.guess
    end

    if gamemode == 2
      code_to_guess = player.player_code
      guesses = computer.guess
    end

    guesses.each do |cell|
      cell += ' ' until cell.length == 6
      updated_row.push(cell)
    end

    board.game_board[round_count] = updated_row
    board.display_game_board

    self.round_count += 1
  end
end

Game.new.play
