class Checkerboard
  attr_reader :size
  def initialize(size)
    @size = size
  end

  def to_s
    "#{colors[0]} #{colors[1]}\n" +
    "#{colors[1]} #{colors[0]}\n"
  end

  def colors
    %w[ B W ]
  end
end
