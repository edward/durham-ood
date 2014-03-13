class Bottles
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    Verse.new(number).to_s
  end
end

class Verse
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    "#{current_inventory} #{current_container} #{liquid} #{location}, ".capitalize +
    "#{current_inventory} #{current_container} #{liquid}.\n" +
    "#{action}, " +
    "#{next_inventory} #{next_container} #{liquid} #{location}.\n"
  end

  private

  def liquid
    'of beer'
  end

  def location
    'on the wall'
  end

  def current_inventory
    case number
    when 0
      'no more'
    else
      number
    end
  end

  def next_inventory
    case number
    when 0
      99
    when 1
      'no more'
    else
      number - 1
    end
  end

  def current_container
    case number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def next_container
    case number
    when 2
      'bottle'
    else
      'bottles'
    end
  end

  def action
    case number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    case number
    when 1
      'it'
    else
      'one'
    end
  end
end
