require 'matrix'

class Checkerboard
  attr_reader :board
  def initialize(size)
    @board = Board.of_size(size)
  end

  def to_s
    board.row_vectors.map do |row|
      row.to_a.join(' ') + "\n"
    end.join
  end
end

class Board
  COLORS = %w[ B W ]

  def self.of_size(size)
    Matrix.build(size, size) { |row, col| color_for_position(row, col, size) }
  end

  def self.color_for_position(rank, file, size)
    index = (rank + file) % size
    COLORS[index]
  end
end
