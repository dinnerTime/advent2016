#!/usr/bin/env ruby

require 'digest'

input = "abbhdwsy"

puts "Beginning..."

beginTime = Time.now.to_f

passcode = ""
def checkHash(prefix, number)
	txt = prefix + number.to_s
	hash = Digest::MD5.hexdigest(txt)
	if hash[0..4] == "00000"
		sixthChar = hash[5]
		passcode = "#{passcode}#{sixthChar}"
		puts "found #{sixthChar}"
		return true
	end
	return false
end

i = 0
#i = 3230000
until passcode.length == 8
	i += 1
	txt = input + i.to_s
	hash = Digest::MD5.hexdigest(txt)
	if hash[0..4] == "00000"
		sixthChar = hash[5]
		span = Time.now.to_f - beginTime
		puts "#{i} found #{sixthChar} from #{hash} in %.2f seconds." % [span]
		passcode = passcode + sixthChar
	end
end

span = Time.now.to_f - beginTime

puts "Found #{passcode} in %.2f seconds." % [span]
