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

	def try_to_solve(neighbours)
		return true if filled_out?
		candidates = (1..9).to_a - neighbours
		@value = candidates[0] if candidates.count == 1 
	end

end