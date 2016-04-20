module LeapYear (isLeapYear) where

divisibleBy :: Int -> Int -> Bool
divisibleBy divisor = (== 0) . (flip rem) divisor

isLeapYear :: Int -> Bool
isLeapYear year = isQuadrennial &&  (not isCentenial || isQuadracentenial)
  where
    isQuadrennial = yearDivisibleBy 4
    isCentenial = yearDivisibleBy 100
    isQuadracentenial = yearDivisibleBy 400
    yearDivisibleBy = (flip divisibleBy) year

