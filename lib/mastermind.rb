require './lib/game'
require './lib/text'

class Mastermind
  include Text
  attr_accessor :tries

  def initialize

  end

  def welcome
    welcome_words
    player_menu_input
  end

  def player_menu_input
    input = gets.chomp

    if input == "p" || input == "play"
      start_game
    elsif input == "i" || input == "instructions"
      instructions
    elsif input == "q" || input == "quit"
      bye
    else
      user_menu
      player_menu_input
    end
  end

  def start_game
    @game = Game.new(self)
    @game.play
    @game.evaluator
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
