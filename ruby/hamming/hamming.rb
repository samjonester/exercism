class Hamming
  VERSION=1
  def self.compute(dnaA, dnaB)
    raise ArgumentError if dnaA.length != dnaB.length
    dnaA.chars.zip(dnaB.chars).count{ |zip| zip[0]!=zip[1] }
  end
end
