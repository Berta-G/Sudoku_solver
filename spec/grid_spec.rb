require './lib/grid'

describe Grid do

	let(:easy_sudoku) {Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')}

	it "should initialize 81 cells" do
		expect(easy_sudoku.cells.count).to eq(81)
	end

	it "should not be solved when initialized" do
		expect(easy_sudoku).not_to be_solved
	end

	it "should solve a sudoku" do
		easy_sudoku.solve_sudoku
		expect(easy_sudoku.outstanding_cells).to eq(0)
		expect(easy_sudoku).to be_solved
	end

	it "should raise an error if the sudoku is not easy" do
		hard_sudoku = Grid.new('015003002000100906270068430490002000001040380003905000900000040860070025000004000')
		expect{hard_sudoku.solve_sudoku}.to raise_error
	end

end
