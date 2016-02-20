class Bob
	# Why does bob use proper punctuation?
	def hey(remark)
		if silenced?(remark)
			'Fine. Be that way!'
		elsif yelled_at?(remark)
			'Whoa, chill out!'
		elsif questioned?(remark)
			'Sure.'
		else
			'Whatever.'
		end
	end

	def silenced?(remark)
		remark !~ /[^\s]/
	end

	def yelled_at?(remark)
		remark =~ /[a-zA-Z]/ && remark.upcase == remark
	end

	def questioned?(remark)
		remark.end_with?('?')
	end
end
