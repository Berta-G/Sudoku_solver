require './lib/cell.rb'



describe Cell do

	let(:cell_default) {Cell.new({:col => 0, :row => 3, :block => 2})}
	let(:cell_with_values) {Cell.new({:value => 1, :col => 0, :row => 3, :block => 2})}

	context "Initialize Cell" do

		it "should be created with value 0 if no value specified" do
			expect(cell_default.value). to eq(0)
		end

		it "value, col, row and block should be the one specified if passed" do 
			expect(cell_with_values.value).to eq(1)
			expect(cell_with_values.col).to eq(0)
			expect(cell_with_values.row).to eq(3)
			expect(cell_with_values.block).to eq(2)
		end
	end

	context "Cell behaivor" do

		it "knows if the final value has not been given" do
			cell_default = Cell.new({:col => 0, :row => 3, :block => 2})
			expect(cell_default).not_to be_filled_out
		end

		it "knows if the final value has been given" do
			expect(cell_with_values).to be_filled_out
		end

		it "can solve itself given 8 neighbour values" do
			cell_with_values.try_to_solve([1,2,3,4,5,6,7,8,9])
			expect(cell_with_values).to be_filled_out
		end
	end

	

end
