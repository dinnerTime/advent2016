#!/usr/bin/env ruby

require 'io/console'

def invert(sequence)
	spl = sequence.split('')
	return [spl[1], spl[0], spl[1]].join()
end

def isAba(sequence)
	charArray = sequence.split('')
	found = []
	i = 0
	until i > charArray.length - 3 do
 		if charArray[i] == charArray[i+2]
				if charArray[i] != charArray[i+1]
					found.push(charArray[i..i+2].join())
				end
		end
		i += 1
	end
	return found
end

def validate(sequence)
	pattern = /\[([^\]]+)\]/
	innerGroups = sequence.scan(pattern)

	ssl = []

	innerGroups.each do |innerGroup|
		aba = isAba(innerGroup.to_s)
		if aba.length > 0
			ssl.push(aba)
		end
	end

	if ssl.length > 0
		scrubbed = sequence.gsub(pattern,'|') 
		scrubbed.split('|').each do |chunk|
			ssl.each do |bab|
				bab.each do |b|
					bString = b.to_s
					if chunk.include? invert(bString)
						puts "found #{chunk} from #{bString}"
						return true
					end
				end
			end
		end
	end

	return false
end

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

 count = 0
 lines.each do |line|
 	valid = validate(line)
 	if valid
 		count += 1
 	end
 end

puts "#{count}"
