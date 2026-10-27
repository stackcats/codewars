module Final where

finalAttackValue :: Int -> [Int] -> Int
finalAttackValue = foldl (\acc d -> if acc >= d then acc + d else acc + gcd acc d)
