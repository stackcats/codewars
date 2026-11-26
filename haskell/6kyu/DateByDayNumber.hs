module DateByDayNumber (getDay) where

days n isLeap
  | n == 2 && isLeap = 29
  | n == 2 = 28
  | n `elem` [1, 3, 5, 7, 8, 10, 12] = 31
  | otherwise = 30

getDay :: Int -> Bool -> String
getDay = go 1
 where
  go i n isLeap
    | n > m = go (succ i) (n - m) isLeap
    | otherwise = toMon i <> ", " <> show n
   where
    m = days i isLeap

toMon i = case i of
  1 -> "January"
  2 -> "February"
  3 -> "March"
  4 -> "April"
  5 -> "May"
  6 -> "June"
  7 -> "July"
  8 -> "August"
  9 -> "September"
  10 -> "October"
  11 -> "November"
  12 -> "December"
