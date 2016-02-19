class Complement
	VERSION=3
	@@comps = {
		'G' => 'C',
		'C' => 'G',
		'A' => 'U',
		'T' => 'A'
	}
	def self.of_dna(dna)
		dna.chars.map do |d| 
			raise ArgumentError if !@@comps.keys.include?(d)
			@@comps[d] 
		end.join('')
	end
end
