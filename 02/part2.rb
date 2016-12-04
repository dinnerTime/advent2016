require 'io/console'

def validKey(pad,x,y)
	return pad[y][x] != '0'
end

result = ""

#keypad = [
#[1,2,3],
#[4,5,6],
#[7,8,9]
#]

keypad = [
['0','0','1','0','0'],
['0','2','3','4','0'], 
['5','6','7','8','9'],
['0','A','B','C','0'],
['0','0','D','0','0'],
]

# Starting position of 5.
x = 0
y = 2

raw_input = IO.binread('input_part2.txt')
lines = raw_input.split("\n")

lines.each do |line|

	from = keypad[x][y].to_s

	line.split('').each do |instruction|

		case instruction 
			when 'U'
				newY = [y - 1, 0].max
				if validKey(keypad, x, newY)
					y = newY
				end
			when 'D'
				newY = [y + 1, 4].min
				if validKey(keypad, x, newY)
					y = newY
				end
			when 'L'
				newX = [x - 1, 0].max
				if validKey(keypad, newX, y)
					x = newX
				end
			when 'R'
				newX = [x + 1, 4].min
				if validKey(keypad, newX, y)
					x = newX
				end
		end

	end

	newKey = keypad[y][x].to_s
	result += newKey

	#puts "#{line} returns #{newKey}"

end

puts "Keypad code is #{result}"