require 'io/console'

result = ""

keypad = [
[1,2,3],
[4,5,6],
[7,8,9]
]

x = 1
y = 1

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")

lines.each do |line|

	from = keypad[x][y].to_s

	line.split('').each do |instruction|

	case instruction 
		when 'U'
			y = [y - 1, 0].max
		when 'D'
			y = [y + 1, 2].min
		when 'L'
			x = [x - 1, 0].max
		when 'R'
			x = [x + 1, 2].min
		end
	end

	newKey = keypad[y][x].to_s
	result += newKey

	#puts "#{line} returns #{newKey}"

end

puts "Keypad code is #{result}"