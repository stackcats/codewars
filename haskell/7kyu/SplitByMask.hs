module SplitByMask (splitPlaces) where

splitPlaces :: [a] -> [Int] -> Maybe [[a]]
splitPlaces xs masks
  | length xs /= sum masks = Nothing
  | otherwise =
      Just $ reverse $ fst $ foldl (\(acc, xs) mask -> (take mask xs : acc, drop mask xs)) ([], xs) masks
