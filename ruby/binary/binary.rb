module BookKeeping
  VERSION = 2
end

class Binary
  def initialize(string)
    throw ArgumentError if string.match(/[^01]/)

    @string = string
  end

  def to_decimal
    chars.reverse.each_with_index.reduce(0) do |conversion, (digit, position)|
      conversion + digit.to_i * 2**position
    end
  end

  def chars
    @string.chars
  end
end
