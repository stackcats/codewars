module AllNonConsecutive (allNonConsecutive) where

allNonConsecutive :: (Eq a, Enum a) => [a] -> [(Int, a)]
allNonConsecutive xs = map (\(i, x, y) -> (i, y)) . filter (\(i, x, y) -> succ x /= y) . zip3 [1 ..] xs $ drop 1 xs
