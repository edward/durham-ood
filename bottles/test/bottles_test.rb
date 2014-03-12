gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bottles'

class BottlesTest < Minitest::Test

  attr_reader :bottles
  def setup
    @bottles = ::Bottles.new
  end

  def test_the_first_verse
    expected = "99 bottles of beer on the wall, 99 bottles of beer.\nTake one down and pass it around, 98 bottles of beer on the wall.\n"
    assert_equal expected, bottles.verse(99)
  end

  def test_the_second_verse
    expected = "98 bottles of beer on the wall, 98 bottles of beer.\nTake one down and pass it around, 97 bottles of beer on the wall.\n"
    assert_equal expected, bottles.verse(98)
  end

  def test_verse_2
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    assert_equal expected, bottles.verse(2)
  end

  def test_verse_1
    expected = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    assert_equal expected, bottles.verse(1)
  end

  def test_verse_0
    expected = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    assert_equal expected, bottles.verse(0)
  end

  def test_a_couple_verses
    expected = "10 bottles of beer on the wall, 10 bottles of beer.\nTake one down and pass it around, 9 bottles of beer on the wall.\n\n9 bottles of beer on the wall, 9 bottles of beer.\nTake one down and pass it around, 8 bottles of beer on the wall.\n\n"
    assert_equal expected, bottles.verses(10, 9)
  end

  def test_the_whole_song
    assert_equal bottles.verses(99, 0), bottles.sing
  end
end
