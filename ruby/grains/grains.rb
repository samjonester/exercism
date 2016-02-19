class Grains
	def self.square(number_of_squares)
		2**(number_of_squares-1)
	end

	def self.total
		(1..64).map{ |n| self.square(n) }.inject(:+)
	end
end
