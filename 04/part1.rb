#!/usr/bin/env ruby

require 'io/console'

def countCharacterOccurance(input, char)
	return input.split('').count { |c| c == char }
end

def uniqueAlphaCharacters(input, doSort)
	characterCount = Hash.new
	input.split('').each do |i|
		if !characterCount.has_key?(i)
			count = countCharacterOccurance(input, i)
			newCount = { i => count }
			characterCount.merge!(newCount)
		end
	end
	
	result = ""
	if doSort
		characterCount = characterCount.sort_by{|k,v| [v * -1 , k] }
	end
	characterCount.each do |key, val|
		if key.match(/[[:alpha:]]/)
			result += key
		end
	end

	return result
end

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

lines.each do |line|

	code = line.match(/\d+/).to_s
	enc = line.gsub(code, '')
	enc = enc.gsub('-', '')
	code = code.to_i

	unsorted = uniqueAlphaCharacters(line, false)
	unsorted = unsorted[0...5]
	sorted = uniqueAlphaCharacters(line, true)
	sorted = sorted[0..5]

	valid = sorted.eql? unsorted
	puts "#{enc} [#{sorted}] vs [#{unsorted}] valid: #{valid}"
end
