# This is the miracle solution
# TODO fix this up
require 'delegate'

class Fixnum
  def to_bottle
    case self
    when 0
      BottleFixnum0.new(self)
    when 1
      BottleFixnum1.new(self)
    else
      BottleFixnum.new(self)
    end
  end
 
  def to_beer_bottle
    case self
    when 0
      BeerSongFixnum0.new(self.to_bottle)
    when 1
      BeerSongFixnum1.new(self.to_bottle)
    else
      BeerSongFixnum.new(self.to_bottle)
    end
  end
end
 
class BeerSongFixnum < SimpleDelegator
  # def initialize
  #   super

  #   class << number
  #     alias_method :predecessor, :pred
  #   end
  # end

  def to_s
    number.to_s + " " + liquid
  end
 
  def liquid
    'of beer'
  end
 
  def location
    'on the wall'
  end
 
  def action
    "Take #{pronoun} down and pass it around"
  end
 
  def next
    # (number.predecessor % 100).to_beer_bottle
    (number.pred % 100).to_beer_bottle
  end
 
  private

  def number
    __getobj__
  end
 
  def pronoun
    'one'
  end
end
 
class BeerSongFixnum1 < BeerSongFixnum
  private
 
  def pronoun
    'it'
  end
end
 
class BeerSongFixnum0 < BeerSongFixnum
  def action
    "Go to the store and buy some more"
  end
end
 
class BottleFixnum < SimpleDelegator
  alias_method :number, :__getobj__
 
  def to_s
    "#{name} #{unit}"
  end
 
  def name
    __getobj__
  end
 
  def unit
    'bottles'
  end
 
  def pred
    number.pred.to_bottle
  end
end
 
class BottleFixnum1 < BottleFixnum
  def unit
    'bottle'
  end
end
 
class BottleFixnum0 < BottleFixnum
  def name
    'no more'
  end
end

class Bottles
  def verse(n)
    n.to_beer_bottle
  end
end