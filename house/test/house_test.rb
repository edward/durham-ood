gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/house'

class HouseTest < Minitest::Test
  def test_randomization
    unshuffled_subjects = ["I’m first", "I’m second", "I’m third"]

    random_seed = 2
    # Shuffled with Random.new(seed = 2)
    shuffled_subjects = ["I’m second", "I’m first", "I’m third"]

    # For EOG
    # There used to be a ton of house-specific  lines of example code in here that I realized I could take out

    shuffler = ShufflerExceptForTheLastElement.new(unshuffled_subjects, random_seed)

    assert_equal shuffled_subjects, shuffler.shuffle
    assert_equal shuffled_subjects.last, shuffler.shuffle.last
  end
end