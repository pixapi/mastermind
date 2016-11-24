require './lib/game'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test
  def test_it_exists
    assert Game.new
  end

  def test_it_has_a_class
    g = Game.new
    assert_instance_of Game, g
  end

  def test_it_can_generates_4_letter_code
    g = Game.new
    assert_equal 4, g.code_generator.length
  end

  def test_it_generates_code_containing_rgby
    g = Game.new
    result = g.code_generator.chars.count {|e| ["r","g","b","y"].include?(e)}

    assert_equal 4, result
  end

  def test_it_creates_unique_code
    g = Game.new
    random_codes = []
    100.times { random_codes << g.code_generator }
    result = random_codes.all? { |e| e == random_codes.first }

    refute result
  end
end
