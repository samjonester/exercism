module PrimeFactors (primeFactors) where

primes :: [Integer]
primes = sieve [2..] 
  where sieve (p:xs) = 
          p : sieve [x | x <- xs, x `mod` p /= 0]

primeFactors :: Integer -> [Integer]
primeFactors n = factors n primes
  where
    factors 1 _ = []
    factors m (p:ps)
      | m < p*p   = [m]
      | r == 0  = p : factors q (p:ps)
      | otherwise = factors m ps
      where (q, r) = quotRem m p
