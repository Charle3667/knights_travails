class KnightsTravails

  def initialize
    @game_board = GameBoard.new
    @game_board = @game_board.board
    @root = nil
  end

  def show_board
    for array in @game_board
      p array
    end
  end

  def travail(start_position = [3, 3], target_array = [4, 3], prev_moves = [])
    unless start_position.nil? || start_position == target_array
      p prev_moves
      p "start position #{start_position}"
      prev_moves.push(start_position)
      move_list = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
      pm = []
      for move in move_list
        # p "move #{move[0]} #{move[1]}"
        move[0] += start_position[0]
        move[1] += start_position[1]
        if !prev_moves.any?(move) && move[0].between?(1, 8) && move[1].between?(1, 8)
          pm.push(move)
        end
      end
      for move in pm
        travail(move, target_array, prev_moves)
      end
    end
  end
  #     if @root.nil?
  #       @root = Node.new(start_position, travail(pm[0], target_array, prev_moves), travail(pm[1], target_array, prev_moves), travail(pm[2], target_array, prev_moves), travail(pm[3], target_array, prev_moves), travail(pm[4], target_array, prev_moves), travail(pm[5], target_array, prev_moves), travail(pm[6], target_array, prev_moves), travail(pm[7], target_array, prev_moves))
  #     else
  #       new_node = Node.new(start_position, travail(pm[0], target_array, prev_moves), travail(pm[1], target_array, prev_moves), travail(pm[2], target_array, prev_moves), travail(pm[3], target_array, prev_moves), travail(pm[4], target_array, prev_moves), travail(pm[5], target_array, prev_moves), travail(pm[6], target_array, prev_moves), travail(pm[7], target_array, prev_moves))
  #     end
  #   end
  # end

  def trav_ones(node = @root)
    unless node.nil?
      p node.data
      trav_ones(node.one)
    end
  end

  def trav_twos(node = @root)
    unless node.nil?
      p node.data
      trav_ones(node.two)
    end
  end

  def trav_threes(node = @root)
    unless node.nil?
      p node.data
      trav_ones(node.three)
    end
  end

  def trav_fours(node = @root)
    unless node.nil?
      p node.data
      trav_ones(node.four)
    end
  end


  class Node
    attr_accessor :data, :one, :two, :three, :four, :five, :six, :seven, :eight

    def initialize(data, one = nil, two = nil, three = nil, four = nil, five = nil, six = nil, seven = nil, eight = nil)
      @data = data
      @one = one
      @two = two
      @three = three
      @four = four
      @five = five
      @six = six
      @seven = seven
      @eight = eight
    end
  end

  class GameBoard
    attr_accessor :board

    def initialize
      @board = create_game_board.reverse
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
  end

end