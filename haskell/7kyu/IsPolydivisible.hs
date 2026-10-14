module IsPolydivisible (isPolydivisible) where

isPolydivisible :: Int -> Bool
isPolydivisible n = go n (length $ show n)
 where
  go n d
    | n == 0 = True
    | n == 1 = True
    | n `mod` d /= 0 = False
    | otherwise = go (n `div` 10) (pred d)
