module DiceRotation (rotations) where

rotations :: [Int] -> Int
rotations dices = minimum $ map (\d -> rotateToTarget d dices) [1 .. 6]

rotateToTarget :: Int -> [Int] -> Int
rotateToTarget target = sum . map (rotate target)

rotate :: Int -> Int -> Int
rotate a b
  | a == b = 0
  | (a, b) `elem` [(1, 6), (2, 5), (3, 4)] = 2
  | (b, a) `elem` [(1, 6), (2, 5), (3, 4)] = 2
  | otherwise = 1
