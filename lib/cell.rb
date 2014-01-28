class Cell

	attr_accessor :value, :col, :row, :block

	def initialize(options={})
		@value = options.fetch(:value, 0)
		@col = options.fetch(:col, 99)
		@row = options.fetch(:row, 99)
		@block = options.fetch(:block, 99)
	end

	def filled_out?
		value != 0
	end

	def candidates
		(0..9).to_a - neighbours
	end

	def neighbours
		ObjectSpace.each_object(Cell).select {|c| c.col == self.col || c.row == self.row || c.block == self.block}.map {|c| c.value}
	end

end