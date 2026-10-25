module Time where

calculateTime :: Int -> Int -> Double
calculateTime battery charger =
  sum $ map (\(b, c) -> (fromIntegral battery * b) / (fromIntegral charger * c)) [(0.85, 1), (0.1, 0.5), (0.05, 0.2)]
