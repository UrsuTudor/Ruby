# frozen_string_literal: true

class Dictionary 
  def initialize
    @dictionary_words = File.read('google-10000-english-no-swears.txt').split
    @current_game_word = game_word
  end

  attr_reader :current_game_word

  private

  def game_word
    usable_words = @dictionary_words.filter { |word| word.length >= 5 && word.length <= 12 }
    @current_game_word = usable_words[rand(0..7557)].split('')
  end
end

class Gallow
  def initialize
    @gallows = [['  ________'], ['   |   |'], ['   |'], ['   |'], ['   |'], [' ___________']]
  end

  attr_accessor :gallows, :number_of_mistakes

  def draw_gallows
    puts gallows
  end

  def draw_stickman(guesses_left)
    case guesses_left
    when 5
      gallows[2] = ['   |   o']
    when 4
      gallows[3] = ['   |   |']
    when 3
      gallows[3] = ['   |  /|']
    when 2
      gallows[3] = ['   |  /|\\']
    when 1
      gallows[4] = ['   |  /']
    when 0
      gallows[4] = ['   |  / \\']
    end
    puts number_of_mistakes
    draw_gallows
  end
end

class Player 
  def initialize
    @player_letter
    @player_word
  end

  attr_accessor :player_letter

  def player_letter_guess
    puts 'Guess a letter, any letter!'
    self.player_letter = gets.chomp
  end
end

class DottedLine
  def initialize
    @line = []
    @wrong_guesses = []
  end

  attr_accessor :line, :wrong_guesses

  def create_dotted_line(current_game_word)
    current_game_word.length.times { line.push('_') }
    puts " \n#{line.join}"
  end
end

class Game 
  def initialize
    @current_game_word = Dictionary.new.current_game_word
    @gallow = Gallow.new
    @gallow.draw_gallows
    @dotted_line = DottedLine.new
    @dotted_line.create_dotted_line(current_game_word)
    p @current_game_word
    @player = Player.new
    @guesses_left = 6
  end

  attr_reader :current_game_word, :player, :gallow
  attr_accessor :dotted_line, :round, :guesses_left

  def handle_player_guess(current_game_word, player_letter_guess, dotted_line)
    current_game_word.each_with_index do |letter, index|
      dotted_line.line[index] = player_letter_guess.downcase if letter == player_letter_guess.downcase
    end
    puts "\nProgress: #{dotted_line.line.join}"

    if current_game_word.none?(player_letter_guess.downcase)
      dotted_line.wrong_guesses.push(player_letter_guess)
      self.guesses_left -= 1
    end
    puts "\nWrong guesses: #{dotted_line.wrong_guesses.join(',')}"
  end

  def winner?
    return unless dotted_line.line == current_game_word

    puts 'Yaay! You got away free!'
    true
  end

  def loser?
    return unless guesses_left.zero?

    puts 'Oh no! Perhaps you will do better in your next life!'
    true
  end

  def play
    until loser? || winner?
      player_letter_guess = player.player_letter_guess
      handle_player_guess(current_game_word, player_letter_guess, dotted_line)
      gallow.draw_stickman(guesses_left)
    end
  end
end

Game.new.play
