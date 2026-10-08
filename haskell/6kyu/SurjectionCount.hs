module SurjectionCount (surjections) where

import Data.Map qualified as M

surjections :: Integer -> Integer -> Integer
surjections n k = factorial k * s n k

factorial :: Integer -> Integer
factorial n = product [1 .. n]

s :: Integer -> Integer -> Integer
s n k = fst $ s' n k M.empty

s' n k mp
  | n == 0 && k == 0 = (1, mp)
  | n == 0 || k == 0 = (0, mp)
  | otherwise =
      case M.lookup (n, k) mp of
        Just v -> (v, mp)
        _ ->
          let (a, mp') = s' (n - 1) (k - 1) mp
              (b, mp'') = s' (n - 1) k mp'
              v = a + k * b
           in (v, M.insert (n, k) v mp'')
