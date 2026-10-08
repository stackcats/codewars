module Average where

avgArray :: [[Int]] -> [Double]
avgArray mat = map ((/ n) . fromIntegral) $ foldl1 (zipWith (+)) mat
 where
  n = fromIntegral $ length mat
