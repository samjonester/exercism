module WordCount (
  wordCount
) where

import Data.List (sort, group)
import Data.Char (toLower, isAlphaNum)
import Data.Map (Map, fromList)
import Data.List.Split (wordsBy)

wordCount :: String -> Map String Int
wordCount = fromList . map (\w -> (head w, length w)) . groupWords
  where
    groupWords = group . sort . nonEmptyWords
    nonEmptyWords = filter (not.null) . words' . map toLower
    words' = wordsBy (not.isAlphaNum)
