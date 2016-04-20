module DNA (toRNA) where

import Data.Maybe

toRNA :: [Char] -> [Char]
toRNA = mapMaybe transcribe
  where
    transcribe 'G' = Just 'C'
    transcribe 'C' = Just 'G'
    transcribe 'T' = Just 'A'
    transcribe 'A' = Just 'U'
    transcribe _ = Nothing
