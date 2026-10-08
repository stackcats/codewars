module ColouredTriangle.Kata where

triangle :: String -> String
triangle [x] = [x]
triangle xs = triangle $ map merge $ zip xs $ tail xs
 where
  merge (a, b)
    | a == b = a
    | otherwise = head $ filter (`notElem` [a, b]) "RGB"
