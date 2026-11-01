module DistributeGifts.Kata (distributeGifts) where

distributeGifts :: [Int] -> Int
distributeGifts = sum . map f

f 1 = 1
f x = if y == 1 then x else y
 where
  y = head [i | i <- [x - 1, x - 2 .. 1], x `mod` i == 0]
