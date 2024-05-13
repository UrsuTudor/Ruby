# frozen_string_literal: true

require 'erb'
require 'json'
require 'pry-byebug'

# loads in the dictionary and gets a random word out
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

# draws the gallows and the stickman
class Gallow
  def initialize
    @gallows = [['  ________'], ['   |   |'], ['   |'], ['   |'], ['   |'], [' ___________']]
  end

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
    draw_gallows
  end

  attr_accessor :gallows
end

# gets player guess
class Player
  def initialize
    @player_letter
  end

  def player_letter_guess
    puts "\nGuess a letter, any letter!"
    self.player_letter = gets.chomp
  end

  private

  attr_accessor :player_letter
end

# creates the dotted line
class DottedLine
  def initialize
    @line = []
  end

  attr_accessor :line

  def create_dotted_line(current_game_word)
    current_game_word.length.times { line.push('_') }
    puts " \n#{line.join}"
  end
end

# brings it all together, handling player guesses and establishing whether the player won or lost
class Game
  def initialize
    @current_game_word = Dictionary.new.current_game_word
    @gallow = Gallow.new
    @gallow.draw_gallows
    @dotted_line = DottedLine.new
    @dotted_line.create_dotted_line(current_game_word)
    @player = Player.new
    @guesses_left = 6
    @wrong_guesses = []
  end

  def choose_game
    puts "\nDo you want to play a new game or load an older save?"
    choice = gets.chomp
    case choice
    when 'new'
      play
    when 'load'
      load_game
      play
    end
  end

  private

  attr_reader :player
  attr_accessor :dotted_line, :round, :guesses_left, :wrong_guesses, :save_file, :current_game_word, :gallow

  def play
    puts "\nRemember, you can save your progress at any point by typing 'save' when the game asks you to guess a letter!"

    until loss? || win?
      player_letter_guess = player.player_letter_guess
      handle_player_guess(current_game_word, player_letter_guess, dotted_line)
      gallow.draw_stickman(guesses_left)
    end
  end

  def handle_player_guess(word, guess, dotted_line)
    numbers = '1234567890'
    # on right guess
    word.each_with_index do |letter, index|
      dotted_line.line[index] = guess.downcase if letter == guess.downcase
    end

    # on save/wrong input/wrong guess
    if guess == 'save'
      save_game
      puts 'Your progress was saved! Feel free to come back later!'
    elsif numbers.include?(guess)
      puts 'Silly, words don\'t have numbers in them!'
    elsif guess.length > 1
      puts 'Only one letter at a time, please!'
    elsif guess == ''
      puts 'Come on, have courage and guess already!'
    elsif word.none?(guess.downcase)
      wrong_guesses.push(guess)
      self.guesses_left -= 1
    end

    puts "\nProgress: #{dotted_line.line.join}"
    puts "\nWrong guesses: #{wrong_guesses.join(',')}"
  end

  def win?
    return unless dotted_line.line == current_game_word

    puts 'Yaay! You got away free!'
    true
  end

  def loss?
    return unless guesses_left.zero?

    puts "The word was:\"#{current_game_word.join}\". Perhaps you will do better in your next life!"
    true
  end

  def save_game
    serialized_game = JSON.dump({ current_game_word: current_game_word,
                                  gallows: gallow.gallows,
                                  dotted_line: dotted_line.line,
                                  guesses_left: guesses_left,
                                  wrong_guesses: wrong_guesses })

    File.open('save.json', 'w') do |file|
      file.puts serialized_game
    end
  end

  def load_game
    save_file = File.read('save.json')
    data = JSON.parse(save_file)

    self.current_game_word = data['current_game_word']
    gallow.gallows = data['gallows']
    dotted_line.line = data['dotted_line']
    self.guesses_left = data['guesses_left']
    self.wrong_guesses = data['wrong_guesses']
  end
end

game = Game.new

game.choose_game
