require './lib/mastermind'
require './lib/text'
require 'pry'

class GameIntermediate
  include Text
  attr_reader :code_i,
              :correct_position,
              :correct_content,
              :minutes,
              :seconds,
              :tries

  def initialize(mastermind)
    @code_i = code_generator_i
    @tries = 0
    @mastermind = mastermind
  end

  def code_generator_i
    @start_time = Time.now
    array = ['r','b','y','g','p']
    code = []
    5.times do
      code << array.sample
    end
    code.join.upcase
  end

  def play_i
    code_structure_i
  end

  def evaluator_i
    input = gets.chomp
    input = input.upcase
    if input.length == 5 && input.count('RBYGP') == 5
      @tries += 1
      compare_i(input)
    elsif input == "Q" || input == "QUIT"
      bye
    elsif input == "C" || input == "CHEAT"
      cheat(@code_i)
      try_again_i
      evaluator_i
    elsif input.length < 5
      input_too_short_i
      evaluator_i
    elsif input.length > 5
      input_too_long_i
      evaluator_i
    else
      try_again_i
      evaluator_i
    end
  end

  def compare_i(input)
    if input == @code_i
      time_track
    elsif input != @code_i
      position_check_i(input)
    end
  end

  def position_check_i(input)
    verify = input.chars.zip(code_i.chars).map { |x, y| x == y }
    @correct_position = verify.count(true)
    content_check_i(input)
  end

  def content_check_i(input)
    @correct_content = @code_i.count(input)
    guess_feedback_i(input)
  end

  def time_track
      finish_time = Time.now
      @minutes = finish_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
      @seconds = finish_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
      end_game
  end

  def guess_feedback_i(input)
    feedback(input, correct_position, correct_content, tries)
    evaluator_i
  end

  def end_game
    congrats(code_i, tries, minutes, seconds)
    @mastermind.player_menu_input
  end
end
