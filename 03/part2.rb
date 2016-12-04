#!/usr/bin/env ruby

require 'io/console'

def valid(a,b,c)
	return a + b > c &&
	a + c > b &&
	c + b > a
end

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

groupsOfThree = []
triangles = []

group = 0
buffer = ""
lines.each do |line|

	buffer += line
	group += 1

	if group == 3
		group = 0
		groupsOfThree.push(buffer)
		buffer = ""
	end

end

groupsOfThree.each do |x|
	x = x.gsub(/ +/, ' ')

	sides = []

	x.split(' ').each do |num|
		sides.push(num.to_i)
	end

	triangle1 = [sides[0],sides[3],sides[6]]
	triangle2 = [sides[1],sides[4],sides[7]]
	triangle3 = [sides[2],sides[5],sides[8]]
	triangles.push(triangle1)
	triangles.push(triangle2)
	triangles.push(triangle3)

end

#triangles.each do |tri|
#	puts "found " + tri.to_s
#end

c = triangles.count { |sides| valid(sides[0],sides[1],sides[2]) }
puts "Counted #{c} valid triangles."
