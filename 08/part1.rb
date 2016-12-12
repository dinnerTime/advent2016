#!/usr/bin/env ruby

require 'io/console'
load 'gridMethods.rb'

#raw_input = IO.binread('testInput.txt')
#grid = createGrid(7,3,".")

raw_input = IO.binread('input.txt')
grid = createGrid(50,6,".")

lines = raw_input.split("\n")
lines.each do |line|
	instructions = line.split(' ') 
	case instructions[0]

	when 'rotate'
		# rotate column x=1 by 1
		direction = instructions[2].split('=')
		dimension = direction[0]
		i = direction[1].to_i
		magnitude = instructions.last.to_i
		rotateGrid(grid, dimension, i, magnitude)

	when 'rect'
		# rect 3x2
		dimensions = instructions[1].split('x')
		rect = createGrid(dimensions[0].to_i, dimensions[1].to_i, "\#")
		pushGrid(grid, rect)
	end
end

grid.each do |x|
    puts x.join()
end

count = 0
grid.each do |x|
    x.each do |y|
        if y == "#"
            count += 1
        end
    end
end

puts "Found #{count} lit pixels."
