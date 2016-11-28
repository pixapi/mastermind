require './lib/game_beginner'
require './lib/game_intermediate'
require './lib/game_advanced'
require './lib/text'

class Mastermind
  include Text
  attr_accessor :tries

  def welcome
    welcome_words
    player_menu_input
  end


  def player_menu_input
    input = gets.chomp

    if input == "p" || input == "play"
      level_menu
    elsif input == "i" || input == "instructions"
      instructions
    elsif input == "q" || input == "quit"
      bye
    else
      user_menu
      player_menu_input
    end
  end

  def level_menu
    level_menu_options
    input = gets.chomp
    input = input.downcase

    if input == "b" || input == "beginner"
      start_game_beginner
    elsif input = "i" || input == "intermediate"
      start_game_intermediate
    elsif input = "a" || input == "advanced"
      start_game_advanced
    else
      level_menu #fix this, currently doesn't go to menu but leaves game
    end
  end

  def start_game_beginner
    @game_b = GameBeginner.new(self)
    @game_b.play_b
    @game_b.evaluator_b
  end

  def start_game_intermediate
    @game_i = GameIntermediate.new(self)
    @game_i.play_i
    @game_i.evaluator_i
  end

  def start_game_advanced
    @game_a = GameAdvanced.new(self)
    @game_a.play_a
    @game_a.evaluator_a
  end

  def instructions
    game_instructions
    player_menu_input
  end
end

if __FILE__ == $0
  m = Mastermind.new
  m.welcome
end
