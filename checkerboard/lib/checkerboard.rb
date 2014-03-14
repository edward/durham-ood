require 'matrix'

class Checkerboard
  attr_reader :board
  def initialize(size)
    @board = Board.new(size)
  end

  def to_s
    board.rows{|row| row.join(' ') + "\n"}.join
  end
end

class Board
  COLORS = %w[ B W ]

  attr_reader :board
  def initialize(size)
    @board = Matrix.build(size, size) do |row, col|
      color_for_position(row, col)
    end
  end

  def rows
    board.row_vectors.map{|row| yield row.to_a}
  end

private
  def color_for_position(rank, file)
    index = (rank + file) % 2
    COLORS[index]
  end
end
