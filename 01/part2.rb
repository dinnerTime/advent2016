require 'io/console'

def makeOrderedRange(a, b)
	r = []
	i = a
	if a == b
		r.push(i)
	elsif a >= b
		until i == b do
			r.push(i)
			i -= 1
		end
		r.push(b)
	else
		until i == b do
			r.push(i)
			i += 1
		end
		r.push(b)
	end
	return r
end

def plot(positions,x,y)
	ll = positions.last
	prevX = ll[0]
	prevY = ll[1]

	i = 0
	if prevX == x
		r = makeOrderedRange(prevY,y)
		r.each do |current|
			if i > 0
				if positions.include? [x,current]
					#puts "INTERSECT #{x} : #{current}"
			    positions.push [x,current]
					return [x,current]
				else
			    positions.push [x,current]
			  end
		  end
		  i += 1
		end
	elsif prevY == y
		r = makeOrderedRange(prevX,x)
		r.each do |current|
			if i > 0
				if positions.include? [current,y]
					#puts "INTERSECT #{current} : #{current}"
					positions.push [current,y]
					return [current,y]
				else
					positions.push [current,y]
				end
		  end
		  i += 1
		end
	else
		puts "Either? What?"
	end

	return nil
end

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
currentX = 0
currentY = 0
plots = [[0,0]]

instructions.each do |i|

	if i =~ /L/
		direction = turn(direction, true)
	elsif i =~ /R/
		direction = turn(direction, false)
	end

	distance = i[/\d+/].to_i

	case direction
	when 'north'
		currentY += distance
	when 'south'
		currentY -= distance
	when 'east'
		currentX += distance
	when 'west'
		currentX -= distance
	end

	if plot(plots, currentX, currentY) != nil
		currentX = plots.last[0]
		currentY = plots.last[1]
		puts "visited #{currentX} : #{currentY} twice!"
		break
	end
	puts "still going"

end

#plots.each do |plot|
#	x = plot[0]
#	y = plot[1]
#	puts "#{x} : #{y}"
#end

sum = currentY.abs + currentX.abs
puts "We are going a total of #{sum}"

