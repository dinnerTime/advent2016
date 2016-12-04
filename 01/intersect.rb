require 'io/console'

#R8, R4, R4, R8

points = [[0,0], [8,0], [8,-4], [4,-4], [4,4]]

def get_line_intersection(p0_x, p0_y, p1_x, p1_y, p2_x, p2_y, p3_x, p3_y)#, i_x, i_y)
    s1_x = p1_x - p0_x
    s1_y = p1_y - p0_y
    s2_x = p3_x - p2_x
    s2_y = p3_y - p2_y

		i_x = Float(0)
		i_y = Float(0)
		s = 0
		t = 0

    s = (-s1_y * (p0_x - p2_x) + s1_x * (p0_y - p2_y)) / (-s2_x * s1_y + s1_x * s2_y)
    t = ( s2_x * (p0_y - p2_y) - s2_y * (p0_x - p2_x)) / (-s2_x * s1_y + s1_x * s2_y)

    if s >= 0 && s <= 1 && t >= 0 && t <= 1
        # Collision detected
        puts "OH! #{i_x} #{i_y}"
        if i_x != 0.0
            i_x = p0_x + (t * s1_x)
        end
        if i_y != 0.0
            i_y = p0_y + (t * s1_y)
        end
        puts "found it #{i_x} #{i_y} #{s} #{t}"
        return [i_x, i_y]
    end

    return nil # No collision
end

p0x = Float(0.0)
p0y = Float(0.0)
p1x = Float(0.0)
p1y = Float(4.0)
p2x = Float(-2.0)
p2y = Float(2.0)
p3x = Float(2.0)
p3y = Float(2.0)

result = get_line_intersection(p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y)

if result != nil
	ix = result[0]
	iy = result[1]
	puts "found #{ix} and #{iy}"
else
	puts "found none"
end
