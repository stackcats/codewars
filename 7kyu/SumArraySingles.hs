module SumArraySingles (repeats) where

import Data.Set qualified as Set

repeats :: [Int] -> Int
repeats = fst . foldl (\(acc, st) n -> if Set.member n st then (acc - n, st) else (acc + n, Set.insert n st)) (0, Set.empty)
