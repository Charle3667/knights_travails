class GameBoard
  attr_accessor :board

  def initialize
    @board = create_game_board
  end

  def create_game_board(array = [], y = 0)
    y += 1
    if y < 9
      array.push(create_row(y))
      create_game_board(array, y)
    end
    array
  end

  def create_row(y, x = 0)
    array = []
    until x > 7
      x += 1
      array.push([x, y])
    end
    array
  end

  def show_board
    reverse = @board.reverse
    for array in reverse
      p array
    end
  end

end