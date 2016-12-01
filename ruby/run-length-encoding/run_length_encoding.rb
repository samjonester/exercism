class RunLengthEncoding
  def self.encode(input)
    letters(input).reduce('', &method(:encode_letters))
  end

  def self.letters(input)
    input.chars.lazy
  end

  def self.encode_letters(encoding, letter)
    "#{trim(encoding, letter)}#{count(encoding, letter)}#{letter}"
  end

  def self.last_count(letter)
    /([\d]+)?#{letter}$/
  end

  def self.trim(encoding, letter)
    encoding.sub(last_count(letter), '')
  end

  def self.count(encoding, letter)
    if match = last_count(letter).match(encoding)
      (match[1] || 1).to_i + 1
    end
  end




  def self.decode(input)
    counts(input).reduce('', &method(:decode_letters))
  end

  def self.counts(encoding)
    encoding.scan(/([\d]+)*([^\d])/).lazy
  end

  def self.decode_letters(decoding, (count, letter))
    "#{decoding}#{letter * (count || 1).to_i}"
  end
end

module BookKeeping
  VERSION = 2
end
