require './lib/mastermind'
require 'minitest/autorun'
require 'minitest/pride'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert Mastermind.new
  end

  def test_it_has_a_class
    m = Mastermind.new
    assert_instance_of Mastermind, m
  end

  def test_it_starts_with_zero_tries
    m = Mastermind.new
    assert_equal 0, m.tries
  end

  def test_it_greets_player_to_start
    m = Mastermind.new
    expected = "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal expected, m.welcome
  end

  # def test_it_display_instructions_if_press_i
  #   m = Mastermind.new
  #   expected = "Mastermind consists on guessing a secret code that consists in four elements containing R(red), Y(yellow), B(blue), G(green).
  #   Please select(p)lay, read the (i)nstructions, or (q)uit."
  #   assert_equal expected, m.player_menu_input
  # end

  # def test_it_stops_game_if_press_q
  #   m = Mastermind.new
  #   assert_equal "See you soon.", m.player_menu_input
  # end
end
