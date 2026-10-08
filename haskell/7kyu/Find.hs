module Find where

data Val = F (Int -> Bool) | I Int

instance Show Val where
  show (F a) = "F" ++ "(Int -> Bool)"
  show (I a) = "I " ++ show a

findFunction :: [Val] -> [Int] -> [Int]
findFunction fs xs = foldl f xs fs
 where
  f xs (F f) = filter f xs
  f xs _ = xs
