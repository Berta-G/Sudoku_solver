class Grid

	def initialize(str)
		@cells = cells_generation(str)
	end

	attr_accessor :cells

	def cells_generation(str)
		str.chars.map.with_index {|value, index| create_new_cell(value.to_i, index)}
	end

	def create_new_cell(value,index)
		row = index/9
		col = index%9
		block = [row/3, col/3]
		Cell.new({:value => value, :row => row, :col => col, :block => block})	
	end

	def solve_sudoku
		while !solved? do
			outstanding_before = outstanding_cells
			
		
			@cells.each { |cell| cell.try_to_solve(neighbours(cell))}
			puts "outstanding after= #{outstanding_cells}"
			puts "outstanding before= #{outstanding_before}"
			puts solved? ? "solved" : "not solved"
			
			raise "Not an easy sudoku" if outstanding_before == outstanding_cells
		end	
		print_sudoku 

	end

	def neighbours(cell)
		@cells.select {|c| c.col == cell.col || c.row == cell.row || c.block == cell.block}.map {|c| c.value}
	end

	def print_sudoku
		@cells.map {|n| n.value}.each_slice(9).map {|n| p n}
	end

	def block(x,y)
		[x/3, y/3]
	end

	def outstanding_cells
		@cells.select {|cell| !cell.filled_out?}.count
	end

	def solved?
		outstanding_cells == 0
	end

end