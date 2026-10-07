module Paul where

paul :: [String] -> String
paul xs
  | total < 40 = "Super happy!"
  | total < 70 = "Happy!"
  | total < 100 = "Sad!"
  | otherwise = "Miserable!"
 where
  total = sum $ map score xs

score "kata" = 5
score "Petes kata" = 10
score "life" = 0
score "eating" = 1
score _ = 0
