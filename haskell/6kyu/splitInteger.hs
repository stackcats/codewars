module Split (splitInteger) where

splitInteger :: Int -> Int -> [Int]
splitInteger x n = go m $ replicate n d
 where
  (d, m) = x `divMod` n

  go 0 xs = xs
  go ct (x : xs) = succ x : go (ct - 1) xs
