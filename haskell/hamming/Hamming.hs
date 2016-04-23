module Hamming (
  distance
) where

distance :: String -> String -> Int
distance = (distance'.).zip
  where
    distance' = length.(filter notEqual')
    notEqual' (f,s) = f /= s
