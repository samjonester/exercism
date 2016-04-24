module Anagram (
                anagramsFor
               ) where

import Data.List
import Data.Function
import qualified Data.Char as Char

stringToLower :: String -> String
stringToLower = map Char.toLower

deleteAll :: Eq a => a -> [a] -> [a]
deleteAll a = filter (/= a)

anagramsFor :: String -> [String] -> [String]
anagramsFor = filter.isAnagramOf
  where
    isAnagramOf = isAnagramOf' `on` stringToLower
    isAnagramOf' = (flip elem).permutations'
    permutations' seed = deleteAll seed $ permutations seed
