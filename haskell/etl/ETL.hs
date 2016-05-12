module ETL (
  transform
) where

import Data.Map as Map
import Data.List as List
import Data.Char

transform :: Map.Map Int [String] -> Map String Int
transform = Map.fromList . concat . reduceMap . Map.toList 
 where
   reduceMap [] = []
   reduceMap ((score, chars) : xs) = convertScores score chars : reduceMap xs
   convertScores score = List.map (\char -> (strToLower char, score))
   strToLower = List.map toLower

