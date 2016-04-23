module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor interaction
    | shouting         = "Whoa, chill out!"
    | questioning      = "Sure."
    | silence          = "Fine. Be that way!"
    | otherwise        = "Whatever."
    where
      silence = all isSpace interaction
      shouting = any isAlpha interaction && (all isUpper.filter isAlpha) interaction
      questioning = (not.null) interaction &&  ((== '?').last) interaction
      letters = filter isAlpha interaction

