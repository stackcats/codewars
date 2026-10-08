module Circle where

circleArea :: Double -> Maybe Double
circleArea x
  | x > 0 = Just $ x ^ 2 * pi
  | otherwise = Nothing
