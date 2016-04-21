module Sublist (
                  Sublist(..)
                , sublist
                ) where

data Sublist = Equal | Sublist | Superlist | Unequal deriving (Show, Eq)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist a b 
    | a == b              = Equal
    | isInfixOf' a b      = Sublist
    | isInfixOf' b a      = Superlist
    | otherwise           = Unequal
    where
      isInfixOf' xs ys = any (isPrefixOf' xs) (tails ys)
      isPrefixOf' [] _ = True
      isPrefixOf' _ [] = False
      isPrefixOf' (x:xs) (y:ys)
            | x == y            = isPrefixOf' xs ys
            | otherwise         = False
      tails [] = []
      tails xs = xs : tails (tail xs)
