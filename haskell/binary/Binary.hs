module Binary (toDecimal) where

import Data.Maybe (fromMaybe)
import Data.Foldable (foldlM)

toBinaryDigit :: Char -> Maybe Int
toBinaryDigit '1' = Just 1
toBinaryDigit '0' = Just 0
toBinaryDigit _ = Nothing


toDecimal :: String -> Int
toDecimal = fromMaybe 0 . foldlM calculateBinary 0
  where
    calculateBinary total x = (2 * total +) <$> toBinaryDigit x

