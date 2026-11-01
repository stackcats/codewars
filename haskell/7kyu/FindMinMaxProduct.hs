module FindMinMaxProduct where

findMinMaxProduct :: [Integer] -> Int -> Maybe (Integer, Integer)
findMinMaxProduct xs k
  | length xs < k = Nothing
  | otherwise = Just (minimum cs, maximum cs)
 where
  cs = map product $ combinations k xs

combinations 0 _ = [[]]
combinations _ [] = []
combinations k (x : xs) = map (x :) (combinations (k - 1) xs) ++ combinations k xs
