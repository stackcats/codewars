module ExtendedWeekends where

import Data.Time

solve :: Integer -> Integer -> (String, String, Int)
solve a b = (h, l, length xs)
 where
  xs = [t | y <- [a .. b], m <- [1 .. 12], let t = (fromGregorian y m 1), gregorianMonthLength y m == 31, dayOfWeek t == Friday]
  h = formatTime defaultTimeLocale "%b" (head xs)
  l = formatTime defaultTimeLocale "%b" (last xs)
