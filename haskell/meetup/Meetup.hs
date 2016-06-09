module Meetup (Weekday(..),
              Schedule(..),
              meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, gregorianMonthLength)
import Data.Time.Calendar.WeekDate (toWeekDate)
import Data.Maybe (fromMaybe)

data Weekday =  Sunday
             | Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday deriving (Enum, Eq)

toWeekDay :: Year -> Month -> Date -> Maybe Weekday
toWeekDay year month date = pluckDay . toWeekDate $ fromGregorian year month date
  where
    pluckDay (_, _, 1) = Just Monday
    pluckDay (_, _, 2) = Just Tuesday
    pluckDay (_, _, 3) = Just Wednesday
    pluckDay (_, _, 4) = Just Thursday
    pluckDay (_, _, 5) = Just Friday
    pluckDay (_, _, 6) = Just Saturday
    pluckDay (_, _, 7) = Just Sunday
    pluckDay _ = Nothing

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth

type Year = Integer
type Month = Int
type Date = Int

dateRange :: Schedule -> Year -> Month -> [Int]
dateRange First _ _ = [1..7]
dateRange Second _ _ = [8..14]
dateRange Third _ _ = [15..21]
dateRange Fourth _ _ = [22..28]
dateRange Teenth _ _ = [13..19]
dateRange Last year month = [(monthLength - 6)..monthLength] 
  where
    monthLength = gregorianMonthLength year month

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay schedule weekday year month = fromGregorian year month parsedDay
  where
    parsedDay = head $ filter isDesiredWeekday datesInScheduleRange
    isDesiredWeekday = fromMaybe False . fmap (== weekday) . toWeekDay year month
    datesInScheduleRange = dateRange schedule year month
