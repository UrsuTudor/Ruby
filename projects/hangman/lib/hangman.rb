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
    @number_of_mistakes = 0
    @gallows = [['  ________'], ['   |   |'], ['   |'], ['   |'], ['   |'], [' ___________']]
  end

  attr_accessor :gallows, :number_of_mistakes

  def draw_gallows
    puts gallows
  end

  def draw_stickman
    self.number_of_mistakes += 1
    case self.number_of_mistakes
    when 1
      gallows[2] = ['   |   o']
    when 2
      gallows[3] = ['   |   |']
    when 3
      gallows[3] = ['   |  /|']
    when 4
      gallows[3] = ['   |  /|\\']
    when 5
      gallows[4] = ['   |  /']
    when 6
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
  end

  attr_accessor :line

  def create_dotted_line(current_game_word)
    current_game_word.length.times { line.push('_') }
    puts " \n#{line.join}"
  end

  def update_dotted_line(current_game_word, player_letter_guess, dotted_line)
    current_game_word.each_with_index do |letter, index|
      dotted_line.line[index] = player_letter_guess if letter == player_letter_guess
    end
    puts line.join
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
  end

  attr_reader :current_game_word, :player
  attr_accessor :dotted_line

  def play
    current_game_word.length.times do
      player_letter_guess = player.player_letter_guess
      dotted_line.update_dotted_line(current_game_word, player_letter_guess, dotted_line)
    end
  end
end

Game.new.play

# next step is updating the dotted line with the player guess; you have  DottedLine and a Player class for that
