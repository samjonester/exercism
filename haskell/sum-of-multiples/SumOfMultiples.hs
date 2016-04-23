module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples multiples maxBound = sum $ filter (isMultiple multiples) range
    where
      isMultiple multiples val = any (divisibleBy val) multiples
      divisibleBy val = (== 0).(rem val)
      range = [1..maxBound-1]
