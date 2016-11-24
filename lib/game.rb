require './lib/mastermind'
require 'pry'

class Game
  include Text
  attr_reader :code,
              :correct_position,
              :correct_content,
              :minutes,
              :seconds,
              :tries

  def initialize(mastermind)
    @code = code_generator
    @tries = 0
    @mastermind = mastermind
  end

  def code_generator
    @start_time = Time.now
    array = ['r','b','y','g']
    code = []
    4.times do
      code << array.sample
    end
    code.join.upcase
  end

  def play
    code_structure
  end

  def evaluator
    input = gets.chomp
    input = input.upcase
    if input.length == 4 && input.count('RBYG') == 4
      @tries += 1
      compare(input)
    elsif input == "Q" || input == "QUIT"
      bye
    elsif input == "C" || input == "CHEAT"
      cheat(@code)
      try_again
      evaluator
    elsif input.length < 4
      input_too_short
      evaluator
    elsif input.length > 4
      input_too_long
      evaluator
    else
      try_again
      evaluator
    end
  end

  def compare(input)
    if input == @code
      time_track
    elsif input != @code
      position_check(input)
    end
  end

  def position_check(input)
    verify = input.chars.zip(code.chars).map { |x, y| x == y }
    @correct_position = verify.count(true)
    content_check(input)
  end

  def content_check(input)
    @correct_content = @code.count(input)
    guess_feedback(input)
  end

  def time_track
      finish_time = Time.now
      @minutes = finish_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
      @seconds = finish_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
      end_game
  end

  def guess_feedback(input)
    feedback(input, correct_position, correct_content, tries)
    evaluator
  end

  def end_game
    congrats(code, tries, minutes, seconds)
    @mastermind.player_menu_input
  end
end
