module TheShellGame where

-- Given the starting index of the ball, and the sequence of swaps,
-- return the final position of the ball.
findTheBall :: Int -> [(Int, Int)] -> Int
findTheBall i = foldl f i
 where
  f curr (a, b)
    | curr == a = b
    | curr == b = a
    | otherwise = curr
