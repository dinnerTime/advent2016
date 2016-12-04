require 'io/console'

def turn(from, left)
	if left
		case from
		when 'north'
			return 'west'
		when 'west'
			return 'south'
		when 'south'
			return 'east'
		when 'east'
			return 'north'
		end
	else
		case from
		when 'north'
			return 'east'
		when 'east'
			return 'south'
		when 'south'
			return 'west'
		when 'west'
			return 'north'
		end
	end
end

raw_input = IO.binread('input.txt')
instructions = raw_input.split(', ')
direction = 'north'
x = 0
y = 0

instructions.each do |i|
	if i =~ /L/
		direction = turn(direction, true)
	elsif i =~ /R/
		direction = turn(direction, false)
	end

	distance = i[/\d+/].to_i

	case direction
	when 'north'
		y += distance
	when 'south'
		y -= distance
	when 'east'
		x += distance
	when 'west'
		x -= distance
	end

	#puts "#{x} , #{y}"

end
sum = y.abs + x.abs
puts "We are going a total of #{sum}"
