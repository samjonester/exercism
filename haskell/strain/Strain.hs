module Strain (
                keep
              , discard
              ) where

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep f (x:xs) = if f x
                then x : keep f xs
                else keep f xs

discard :: (a -> Bool) -> [a] -> [a]
discard = (keep.(not.))
