class GameBoard

  def initialize
    puts 'initialized'
    @root = nil
  end

  def build_board(row = @root, y = 1)
    if y < 8
      if row == nil
        @root = Row.new(build_row(nil, y))
        @root.top = build_board(@root, y)
      else
        y += 1
        temp_hold = row
        row.top = Row.new(build_row(nil, y))
        row = row.top
        row.bottom = temp_hold
        row.top = build_board(row, y)
        row
      end
    end
  end

  def build_row(node = nil, y = 1, x = 0)
    if node == nil
      p 'start'
      x += 1
      node = Node.new([x, y])
      p node.lat
      node.right = build_row(node, y, x)
    else
      unless x == 8
        x += 1
        temp_hold = node
        node.right = Node.new([x, y])
        node = node.right
        p node.lat
        node.left = temp_hold
        node.right = build_row(node, y, x)
      end
    end
  end

  def ret_middle
    p @root.top.long

  end

  class Node
    attr_accessor :lat, :right, :left
    def initialize(lat, right = nil, left = nil)
      @lat = lat
      @right = right
      @left = left
    end
  end

  class Row
    attr_accessor :long, :top, :bottom

    def initialize(long, top = nil, bottom = nil)
      @long = long
      @top = top
      @bottom = bottom
    end
  end
end