class Squares
	VERSION=2

	def initialize(n)
		@numbers = (0..n)
	end

	def square_of_sum
		@numbers.reduce(:+)**2
	end

	def sum_of_squares
		@numbers.map{ |n| n**2 }.reduce(:+)
	end

	def difference
		(sum_of_squares - square_of_sum).abs
	end
end
