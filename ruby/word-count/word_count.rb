class Phrase
	VERSION=1

	attr_reader :word_count

	def initialize(phrase)
		@word_count = phrase.downcase.scan(/\b[\w']+\b/).each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
	end
end
