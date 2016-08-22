module Atbash (encode) where

import Data.List.Split (chunksOf)
import Data.Char (toLower, isAsciiLower, isDigit)
import Data.List (elemIndex, unwords)
import Data.Maybe (fromJust)

(.||.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
(.||.) f g a = f a || g a

bool :: (a -> b) -> (a -> b) -> (a -> Bool) -> a -> b
bool false true predicate value = if predicate value then true value else false value

aToZ :: [Char]
aToZ = ['a' .. 'z']

zToA :: [Char]
zToA = reverse aToZ

encode :: String -> String
encode = split . cipher . prepare
  where
    prepare = filter (isAsciiLower .||. isDigit) . fmap toLower
    split = unwords . chunksOf 5
    cipher = fmap convertIfAscii
    convertIfAscii = bool id convert isAsciiLower
    convert = (zToA !!) . fromJust . (`elemIndex` aToZ)
