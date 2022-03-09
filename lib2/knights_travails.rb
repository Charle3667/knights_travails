class KnightsTravails

  def initialize
    @root = nil
    @prev_moves = []
    @to_do_list = []
    @target = nil
    @path = []
  end

  def show_board
    for array in @game_board
      p array
    end
  end

  def create_node(start_position = nil, target_position = nil, prev_node = nil)
    if !start_position.nil?
      @prev_moves.push(start_position)
      if @root.nil?
        @root = Node.new(start_position)
        @to_do_list.push(@root)
      else
        if start_position == target_position
          @target = Node.new(start_position, prev_node)
          @target
        else
          node = Node.new(start_position, prev_node)
          @to_do_list.push(node)
          node
        end
      end
    else
      nil
    end
  end
  
  def find_possible_moves(start_position)
    move_list = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    pm = []
    for move in move_list
      # p "move #{move[0]} #{move[1]}"
      move[0] += start_position[0]
      move[1] += start_position[1]
      if !@prev_moves.any?(move) && move[0].between?(1, 8) && move[1].between?(1, 8)
        pm.push(move)
      end
    end
    pm
  end

  def create_tree(start_position, target_position)
    create_node(start_position, target_position)
    for move in @to_do_list
      possible_moves = find_possible_moves(move.data)
      move.one = create_node(possible_moves[0], target_position, move)
      move.two = create_node(possible_moves[1], target_position, move)
      move.three = create_node(possible_moves[2], target_position, move)
      move.four = create_node(possible_moves[3], target_position, move)
      move.five = create_node(possible_moves[4], target_position, move)
      move.six = create_node(possible_moves[5], target_position, move)
      move.seven = create_node(possible_moves[6], target_position, move)
      move.eight = create_node(possible_moves[7], target_position, move)
    end
  end

  def find_node
    p "The fastest path to #{@target.data} is:"
    node_path(@target)
    for moves in @path.reverse
      p moves
    end
  end

  def node_path(node)
    unless node.nil?
      @path.push(node.data)
      node_path(node.prev_node)
    end
  end


  class Node
    attr_accessor :data, :prev_node, :one, :two, :three, :four, :five, :six, :seven, :eight

    def initialize(data, prev_node = nil, one = nil, two = nil, three = nil, four = nil, five = nil, six = nil, seven = nil, eight = nil)
      @data = data
      @prev_node = prev_node
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
end








# def create_node(start_position = nil, target_position = nil)
#   if !start_position.nil?
#     @prev_moves.push(start_position)
#     if @root.nil?
#       @root = Node.new(start_position)
#       to_do_list.push(@root)
#     else
#       if start_position == target_position
#         Node.new(start_position)
#       else
#         node = Node.new(start_position)
#         to_do_list.push(node)
#         node
#       end
#     end
#   else
#     nil
#   end
# end

# def find_possible_moves(start_position)
#   move_list = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
#   pm = []
#   for move in move_list
#     # p "move #{move[0]} #{move[1]}"
#     move[0] += start_position[0]
#     move[1] += start_position[1]
#     if !@prev_moves.any?(move) && move[0].between?(1, 8) && move[1].between?(1, 8)
#       pm.push(move)
#     end
#   end
#   pm
# end

# def create_tree(start_position, target_position)
#   if @root.nil?
#     create_node(start_position)
#   else
#     for move in @to_do_list
#       possible_moves = find_possible_moves(start_position)
#       move.one = create_node(possible_moves[0], target_position)
#       move.two = create_node(possible_moves[1], target_position)
#       move.three = create_node(possible_moves[2], target_position)
#       move.four = create_node(possible_moves[3], target_position)
#       move.five = create_node(possible_moves[4], target_position)
#       move.six = create_node(possible_moves[5], target_position)
#       move.seven = create_node(possible_moves[6], target_position)
#       move.eight = create_node(possible_moves[7], target_position)
#     end
#   end
# end



# def travail(start_position = [3, 4], target_array = [4, 3], prev_moves = [])
  #   unless start_position.nil? || start_position == target_array
  #     prev_moves.push(start_position)
  #     move_list = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  #     pm = []
  #     for move in move_list
  #       # p "move #{move[0]} #{move[1]}"
  #       move[0] += start_position[0]
  #       move[1] += start_position[1]
  #       if !prev_moves.any?(move) && move[0].between?(1, 8) && move[1].between?(1, 8)
  #         pm.push(move)
  #       end
  #     end
  #   end
  #   if start_position.nil?
  #     nil
  #   elsif start_position == target_array
  #     Node.new(start_position)
  #   else
  #     if @root.nil?
  #       @root = Node.new(start_position, travail(pm[0], target_array, prev_moves), travail(pm[1], target_array, prev_moves), travail(pm[2], target_array, prev_moves), travail(pm[3], target_array, prev_moves), travail(pm[4], target_array, prev_moves), travail(pm[5], target_array, prev_moves), travail(pm[6], target_array, prev_moves), travail(pm[7], target_array, prev_moves))
  #     else
  #       Node.new(start_position, travail(pm[0], target_array, prev_moves), travail(pm[1], target_array, prev_moves), travail(pm[2], target_array, prev_moves), travail(pm[3], target_array, prev_moves), travail(pm[4], target_array, prev_moves), travail(pm[5], target_array, prev_moves), travail(pm[6], target_array, prev_moves), travail(pm[7], target_array, prev_moves))
  #     end
  #   end
  # end

  # def trav_ones(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_ones(node.one)
  #   end
  # end

  # def trav_twos(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_twos(node.two)
  #   end
  # end

  # def trav_threes(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_threes(node.three)
  #   end
  # end

  # def trav_fours(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_fours(node.four)
  #   end
  # end

  # def trav_fives(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_fives(node.five)
  #   end
  # end

  # def trav_sixes(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_sixes(node.six)
  #   end
  # end

  # def trav_sevens(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_sevens(node.seven)
  #   end
  # end

  # def trav_eights(node = @root)
  #   unless node.nil?
  #     p node.data
  #     trav_eights(node.eight)
  #   end
  # end