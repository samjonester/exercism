class Robot

	def initialize
		@name = create_name
	end

	def reset
		@name = create_name
	end

	def name
		@name
	end

	private
	def create_name
		rand_char+rand_char+rand_num+rand_num+rand_num
	end

	def rand_char
		('A'..'Z').to_a[rand(26)]
	end

	def rand_num
		rand(9).to_s
	end

end
