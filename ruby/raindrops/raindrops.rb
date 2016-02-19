require 'prime'

class Raindrops
	VERSION = 1

	@@rain = {
		3 => 'Pling',
		5 => 'Plang',
		7 => 'Plong'
	}

	def self.convert(n)
		primes = Prime.prime_division(n).flatten.uniq.select { |n| @@rain.has_key?(n) }
		if primes.empty?
			n.to_s
		else
			primes.sort.map{ |n| @@rain[n] }.join("")
		end
	end
end
