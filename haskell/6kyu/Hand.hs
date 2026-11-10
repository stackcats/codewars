module Hand where

getParticipants :: Int -> Int
getParticipants n = until ((>= n) . f) succ 0

f n
  | n < 2 = 0
  | otherwise = sum [1 .. n - 1]
