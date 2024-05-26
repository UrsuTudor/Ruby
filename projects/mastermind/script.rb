# frozen_string_literal:true

# initiates and displays board
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

# generates code on gamemode 1 and computer guesses in gamemode 2
class ComputerPlayer
  def initialize
    @colors = %w[red blue yellow green]
    @guess = []
  end
  attr_reader :colors
  attr_accessor :guess

  def generate_code
    computer_code = []
    4.times { computer_code.push(colors[rand(0..3)]) }
    computer_code
  end

  def computer_guess(player_code)
    i = 0

    4.times do
      if player_code.include?(guess[i])
        puts "I'm included!"
      elsif guess[i] == player_code[i]
        i += 1
        next
      end
      guess[i] = colors[rand(0...4)]
      i += 1
      break if i == 4
    end
  end
end

# stores player guesses in gamemode 1 and player code in gamemode 2
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

# makes it possible to play the game by bringing all elements together
class Game 
  def initialize
    @board = Board.new
    @board.display_game_board
    @computer = ComputerPlayer.new
    @computer_code = computer.generate_code
    @player = HumanPlayer.new
    @round_count = 0
    @winner = false
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
        computer.computer_guess(player.player_code)
        update_board
        compare_codes
        break if winner?
        break if loss?

        next_turn
      end
    end
  end

  private

  attr_reader :board, :computer, :player, :computer_code
  attr_accessor :player_guess, :winner, :round_count, :gamemode

  def choose_gamemode
    puts "Choose gamemode: type 1 if you want to guess the computer's code or 2 if you want the computer to guess your code."
    self.gamemode = gets.chomp.to_i
  end

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

    p 'Congratulations, you cracked the code!'
    self.winner = true
  end

  def loss?
    return unless round_count == 8 && winner == false

    p 'You did not manage to crack the code in 8 rounds. Better luck next time!'
    true
  end

  def update_board
    updated_row = []

    guesses = player.guess if gamemode == 1

    guesses = computer.guess if gamemode == 2

    guesses.each do |cell|
      cell += ' ' until cell.length == 6
      updated_row.push(cell)
    end

    board.game_board[round_count] = updated_row
    board.display_game_board

    self.round_count += 1
  end

  def next_turn
    puts 'Type any key to move on to the next turn!'
    gets
  end
end

Game.new.play

arr1 = [1, 2, 3]
arr2 = [2, 3, 1]

puts 'hey' if arr2.include?(arr1[0])
