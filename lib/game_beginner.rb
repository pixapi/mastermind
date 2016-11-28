require './lib/mastermind'
require './lib/text'
require 'pry'

class GameBeginner
  include Text
  attr_reader :code_b,
              :correct_position,
              :correct_content,
              :minutes,
              :seconds,
              :tries

  def initialize(mastermind)
    @code_b = code_generator_b
    @tries = 0
    @mastermind = mastermind
  end

  def code_generator_b
    @start_time = Time.now
    array = ['r','b','y','g']
    code = []
    4.times do
      code << array.sample
    end
    code.join.upcase
  end

  def play_b
    code_structure_b
  end

  def evaluator_b
    input = gets.chomp
    input = input.upcase
    if input.length == 4 && input.count('RBYG') == 4
      @tries += 1
      compare_b(input)
    elsif input == "Q" || input == "QUIT"
      bye
    elsif input == "C" || input == "CHEAT"
      cheat(@code_b)
      try_again_b
      evaluator_b
    elsif input.length < 4
      input_too_short_b
      evaluator_b
    elsif input.length > 4
      input_too_long_b
      evaluator_b
    else
      try_again_b
      evaluator_b
    end
  end

  def compare_b(input)
    if input == @code_b
      time_track
    elsif input != @code_b
      position_check_b(input)
    end
  end

  def position_check_b(input)
    verify = input.chars.zip(code_b.chars).map { |x, y| x == y }
    @correct_position = verify.count(true)
    content_check_b(input)
  end

  def content_check_b(input)
    @correct_content = @code_b.count(input)
    guess_feedback_b(input)
  end

  def time_track
      finish_time = Time.now
      @minutes = finish_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
      @seconds = finish_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
      end_game
  end

  def guess_feedback_b(input)
    feedback(input, correct_position, correct_content, tries)
    evaluator_b
  end

  def end_game
    congrats(code_b, tries, minutes, seconds)
    @mastermind.player_menu_input
  end
end
