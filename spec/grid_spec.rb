require './lib/grid'

describe Grid do

	it "should initialize 81 cells" do
		grid = Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
		expect(grid.cells.count).to eq(81)
	end

	it "should not be solved when initialized" do
		grid = Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
		expect(grid).not_to be_solved
	end

	it "should solve a sudoku" do
		grid = Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
		grid.solve_sudoku
		expect(grid.outstanding_cells).to eq(0)
		expect(grid).to be_solved
	end

end
