require './lib/mastermind'
require './lib/text'
require 'pry'

class GameAdvanced
  include Text
  attr_reader :code_a,
              :correct_position,
              :correct_content,
              :minutes,
              :seconds,
              :tries

  def initialize(mastermind)
    @code_a = code_generator_a
    @tries = 0
    @mastermind = mastermind
  end

  def code_generator_a
    @start_time = Time.now
    array = ['r','b','y','g','p','o']
    code = []
    6.times do
      code << array.sample
    end
    code.join.upcase
  end

  def play_a
    code_structure_a
  end

  def evaluator_a
    input = gets.chomp
    input = input.upcase
    if input.length == 6 && input.count('RBYGPO') == 6
      @tries += 1
      compare_a(input)
    elsif input == "Q" || input == "QUIT"
      bye
    elsif input == "C" || input == "CHEAT"
      cheat(@code_a)
      try_again_a
      evaluator_a
    elsif input.length < 6
      input_too_short_a
      evaluator_a
    elsif input.length > 6
      input_too_long_a
      evaluator_a
    else
      try_again_a
      evaluator_a
    end
  end

  def compare_a(input)
    if input == @code_a
      time_track
    elsif input != @code_a
      position_check_a(input)
    end
  end

  def position_check_a(input)
    verify = input.chars.zip(code_a.chars).map { |x, y| x == y }
    @correct_position = verify.count(true)
    content_check_a(input)
  end

  def content_check_a(input)
    @correct_content = @code_a.count(input)
    guess_feedback_a(input)
  end

  def time_track
      finish_time = Time.now
      @minutes = finish_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
      @seconds = finish_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
      end_game
  end

  def guess_feedback_a(input)
    feedback(input, correct_position, correct_content, tries)
    evaluator_a
  end

  def end_game
    congrats(code_a, tries, minutes, seconds)
    @mastermind.player_menu_input
  end
end
