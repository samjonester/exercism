require 'pry'
class Prime
	def self.nth(n)
		raise ArgumentError if n<1
		prime = 2
		(n-1).times do
			begin
				prime = prime+1
			end until self.is_prime?(prime)
		end
		prime
	end

	private
	def self.is_prime?(n)
		return false if n == 1
		2.upto(Math.sqrt(n).to_i) do |divisor|
			return false if n%divisor == 0
		end
		true
	end
end
