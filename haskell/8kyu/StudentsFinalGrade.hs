module StudentsFinalGrade (finalGrade) where

finalGrade :: Int -> Int -> Int
finalGrade g n
  | g > 90 || n > 10 = 100
  | g > 75 && n >= 5 = 90
  | g > 50 && n >= 2 = 75
  | otherwise = 0
