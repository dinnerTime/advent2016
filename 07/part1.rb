#!/usr/bin/env ruby

require 'io/console'

def isAbba(sequence)
#	if sequence.length < 4
#		return false
#	end

	charArray = sequence.split('')
	i = 0
	until i > charArray.length - 4 do
		if charArray[i] == charArray[i+3]
			if charArray[i+1] == charArray[i+2]
				return charArray[i] != charArray[i+1]
			end
		end
		i += 1
	end
	return false
end

def validate(sequence)
	pattern = /\[([^\]]+)\]/
	innerGroups = sequence.scan(pattern)
	innerGroups.each do |innerGroup|
		if isAbba(innerGroup.to_s)
			return false
		end
	end

	scrubbed = sequence.gsub(pattern,'|') 

	scrubbed.split('|').each do |chunk|
		if isAbba(chunk)
			return true
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
	puts "#{line} valid: #{valid}"
end

puts "#{count}"
