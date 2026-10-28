module IsFibonacci (isFibo) where

isFibo :: Int -> Int -> Int -> Bool
isFibo a b f
  | a > f = False
  | a == f || b == f = True
  | otherwise = isFibo b (a + b) f
