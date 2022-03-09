require_relative 'knights_travails'

game = KnightsTravails.new
p 'Please select a start position.'
start = gets.strip.to_s.split('').map(&:to_i)
p 'Please select a target position.'
target = gets.strip.to_s.split('').map(&:to_i)
game.create_tree(start, target)
game.find_node
