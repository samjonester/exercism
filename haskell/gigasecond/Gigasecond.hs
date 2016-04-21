module Gigasecond (fromDay) where

import Data.Time.Clock 

fromDay :: UTCTime -> UTCTime
fromDay = addUTCTime gigasecond
    where
      gigasecond :: NominalDiffTime
      gigasecond = 10 ^ (9::Int)
