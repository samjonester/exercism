module Scrabble (scoreLetter,
  scoreWord) where

import qualified Data.Map as Map
import Data.Maybe
import Data.Char

letterScores :: Map.Map Char Int
letterScores = Map.fromList [(letter, val) | (letters, val) <- scoreTable, letter <- letters]
  where
    scoreTable = [("AEIOULNRST", 1),
      ("DG", 2),
      ("BCMP", 3),
      ("FHVWY", 4),
      ("K", 5),
      ("JX", 8),
      ("QZ", 10)]

scoreLetter :: Char -> Int
scoreLetter = fromJust . (flip Map.lookup) letterScores . toUpper

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter
