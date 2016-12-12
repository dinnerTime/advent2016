def createGrid(h,w,c)
	grid = Array.new(w) 
	grid.fill { Array.new(h) { |i| i=c.to_s } }

	return grid
end

def pushGrid(gridA,gridB)
	gridB.each_with_index do |rowValue, i|
		rowValue.each_with_index do |columnValue, j|
			# Assert index in range
			if gridA.length > i && gridA[i].length > j
				gridA[i][j] = columnValue
			end
		end
	end
end

def rotateGrid(grid, dimension, i, magnitude)

	shift = 0
	until shift == magnitude do

		replacements = Hash.new

		case dimension
		when 'x'

			grid.each_with_index do |y, index|

				shiftedIndex = index-1
				if shiftedIndex < 0 
					shiftedIndex = grid.length-1
				end

				replacement = grid[shiftedIndex][i]
				replacements.merge!({[index,i] => replacement})

			end

		when 'y'
				grid[i].each_with_index do |x, index|
						shiftedIndex = index-1
				
						if shiftedIndex < 0 
										shiftedIndex = grid[i].length-1
						end
						
						replacement = grid[i][shiftedIndex]
						replacements.merge!({[i,index] => replacement})
				end	
		end

		replacements.each do |r,v|
			x = r[0]
			y = r[1]
			grid[x][y] = v
		end

		shift += 1
	end
end
