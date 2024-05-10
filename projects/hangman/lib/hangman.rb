# frozen_string_literal: true

class Dictionary 
  def initialize
    @dictionary_words = File.read('google-10000-english-no-swears.txt').split
  end

  def current_game_word
    usable_words = @dictionary_words.filter { |word| word.length >= 5 && word.length <= 12 }
    current_game_word = usable_words[rand(0..7557)]
    current_game_word
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

class Game 
  def initialize
    @current_game_word = Dictionary.new.current_game_word
    @gallow = Gallow.new
    @gallow.draw_gallows
  end
end

Game.new
