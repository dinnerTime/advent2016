#!/usr/bin/env ruby

require 'io/console'
load 'gridMethods.rb'

#grid = createGrid(3,7,".")
grid = createGrid(8,5,".")
gridB = createGrid(9,3,"X")
pushGrid(grid,gridB)

rotateGrid(grid,"x",2,2)

grid.each do |x|
	puts x.join()
end

exit


# raw_input = IO.binread('input.txt')
raw_input = IO.binread('testInput.txt')
lines = raw_input.split("\n")

lines.each do |line|
	instructions = line.split(' ') 
	case instructions[0]

	when 'rotate'
		# rotate column x=1 by 1
		direction = instructions[2].split('=')
		dimension = direction[0]
		i = direction[1]
		magnitude = instructions.last
		rotateGrid(grid, dimension, i, magnitude)
		#puts "rotation is #{dir} index #{i} for #{magnitude} -> (#{line})"
		#rotate(grid, instructions)

	when 'rect'
		# rect 3x2
		dimensions = instructions[1].split('x')
		rect = createGrid(dimensions[0].to_i, dimensions[1].to_i, "\#")
		pushGrid(grid, rect)
	end
	#puts instructions
end

# grid.each do |x|
# 	puts x.join()
# end
