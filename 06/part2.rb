#!/usr/bin/env ruby

require 'digest'
require 'io/console'

def getChar(lines, position)
	map = Hash.new

	i = 0
	until i == lines.length
		line = lines[i]
		posChar = line[position]
		if !map.has_key?(posChar)
			map.merge!({ posChar => 0})
		end
		map[posChar] = map[posChar] + 1
		i += 1
	end

	map = map.sort_by { |k,v| [ v ]}

	return map.first.first
end

output = ""
raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

j = 0
lineLength = lines[0].length
until j == lineLength
	outChar = getChar(lines, j)
	j += 1
	output = output + outChar
end

puts "Found #{output}"
