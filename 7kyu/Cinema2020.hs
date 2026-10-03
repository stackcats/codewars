module Cinema2020 (maximumSeating) where

maximumSeating :: [Int] -> Int
maximumSeating seats = fst $ foldl f (0, occupied) $ zip [0 ..] seats
 where
  occupied = map snd . filter ((== 1) . fst) $ zip seats [0 ..]

  isValid i xs = all (`notElem` xs) [i - 2 .. i + 2]

  f acc (_, 1) = acc
  f (ct, xs) (i, 0) = if isValid i xs then (ct + 1, i : xs) else (ct, xs)
