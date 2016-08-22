module Raindrops (convert) where

type Drop = (Int, String)

raindrops :: [Drop]
raindrops = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

convert :: Int -> String
convert n = case filter hasDrop raindrops of
  [] -> show n
  xs -> concatMap snd xs
  where
    hasDrop (factor, _) = n `divisibleBy` factor
    divisibleBy x y = x `mod` y == 0
