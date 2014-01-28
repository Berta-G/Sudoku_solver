require './lib/cell.rb'



describe Cell do

	context "Initialize Cell" do
		let(:cell_default) {Cell.new({:col => 0, :row => 3, :block => 2})}
		let(:cell_with_values) {Cell.new({:value => 1, :col => 0, :row => 3, :block => 2})}

		it "should be created with value 0 if no value specified" do
			expect(cell_default.value). to eq(0)
		end

		it "value, col, row and block should be the one specified if passed" do 
			expect(cell_with_values.value).to eq(1)
			expect(cell_with_values.col).to eq(0)
			expect(cell_with_values.row).to eq(3)
			expect(cell_with_values.block).to eq(2)
		end

		it "knows if the final value has not been given" do
			expect(cell_default).not_to be_filled_out
		end

		it "knows if the final value has been given" do
			expect(cell_with_values).to be_filled_out
		end
	end

	it "can get the value of its neigbours" do
		cell1 = Cell.new({:value => 0, :col => 9, :row => 3, :block => 2})
		cell2 = Cell.new({:value => 2, :col => 9, :row => 4, :block => 3})
		cell3 = Cell.new({:value => 3, :col => 1, :row => 3, :block => 3})
		cell4 = Cell.new({:value => 4, :col => 1, :row => 4, :block => 2})
		cell5 = Cell.new({:value => 5, :col => 4, :row => 4, :block => 7})
		expect(cell1.neighbours).to eq([4,3,2,0])
	end

	it "calculates the cadidates values" do
		cell1 = Cell.new({:value => 0, :col => 9, :row => 3, :block => 2})
		cell2 = Cell.new({:value => 2, :col => 9, :row => 4, :block => 3})
		cell3 = Cell.new({:value => 3, :col => 1, :row => 3, :block => 3})
		cell4 = Cell.new({:value => 4, :col => 1, :row => 4, :block => 2})
		cell5 = Cell.new({:value => 5, :col => 4, :row => 4, :block => 7})
		expect(cell1.candidates).to eq([1, 5, 6, 7, 8, 9])
	end

end
