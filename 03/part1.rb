#!/usr/bin/env ruby

require 'io/console'

def valid(a,b,c)
	return a + b > c &&
	a + c > b &&
	c + b > a
end

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

result = []

lines.each do |line|

	matches = line.scan(/\d+/)
	result.push(
		[
			matches[0].to_i,
			matches[1].to_i,
			matches[2].to_i
		])

end

c = result.count { |sides| valid(sides[0],sides[1],sides[2]) }

puts "Counted #{c} valid triangles."
