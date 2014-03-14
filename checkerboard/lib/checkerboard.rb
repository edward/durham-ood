require 'matrix'

class Checkerboard
  attr_reader :board
  def initialize(size)
    @board = Board.new(size)
  end

  def to_s
    board.rows do |element|
      element.join(' ') + "\n"
    end.join
  end
end

class Board
  COLORS = %w[ B W ]

  attr_reader :size, :board
  def initialize(size)
    @size = size
    @board = Matrix.build(size, size) { |row, col| color_for_position(row, col) }
  end

  def rows(&block)
    board.row_vectors.map(&:to_a).map(&block)
  end

private
  def color_for_position(rank, file)
    index = (rank + file) % size
    COLORS[index]
  end
end
