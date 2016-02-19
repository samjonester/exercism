class Year
	VERSION=1
	def self.leap?(y)
		year = Year.new(y)
		(year.quadrennial? && !year.century?) || year.quadricentennial?
	end

	def initialize(year)
		@year = year
	end

	def quadrennial?
		divisible_by?(4)
	end

	def quadricentennial?
		divisible_by?(400)
	end

	def century?
		divisible_by?(100)
	end

	def divisible_by?(n)
		@year % n == 0
	end
end
