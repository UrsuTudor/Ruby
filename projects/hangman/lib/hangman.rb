# frozen_string_literal: true

class Dictionary 
  def initialize
    @dictionary_words = File.read('google-10000-english-no-swears.txt').split
  end

  def current_game_word
    usable_words = @dictionary_words.filter { |word| word.length >= 5 && word.length <= 12 }
    current_game_word = usable_words[rand(0..7557)]
  end
end

class Game 
  def initialize
    @current_game_word = Dictionary.new.current_game_word
    p @current_game_word
  end
end

Game.new
