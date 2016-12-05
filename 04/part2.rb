#!/usr/bin/env ruby

require 'io/console'

def shiftChar(char, shift)
	min = 'a'.ord
	max = 'z'.ord
	charIndex = char.ord

	i = 0
	until i == shift do
		charIndex += 1
		if charIndex > max
			charIndex = min
		end
		i += 1
	end

	return charIndex.chr
end

 def decryptString(encrypted, shift)
	 decrypted = ""
		encrypted.split('').each do |char|
 			if char == '-'
 				decrypted += " "
		 	else
		 		newChar = shiftChar(char,shift)
		 		decrypted += newChar
		 	end
		end
		return decrypted
 end

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

# === Begin input. ===============================================================================

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

validTotal = 0

lines.each do |line|
	checksum = line.match(/\[.*\]/).to_s
	encrypted = line.split('[')[0].to_s
	encrypted = encrypted.match(/[a-z\-]+/).to_s
	checksum = checksum.match(/[[:alpha:]]+/)

	code = line.match(/\d+/).to_s
	unique = line.gsub(code, '')
	unique = unique.gsub('-', '')

	code = code.to_i

	sorted = uniqueAlphaCharacters(unique, true)
	sorted = sorted[0..4]

	valid = sorted.to_s == checksum.to_s

	decrypted = decryptString(encrypted, code)

	if decrypted.match('north') && valid
		puts "#{valid} ? #{decrypted} => #{code}"
	end

	if valid
		validTotal += code
	end
end

