module Ch02.Beside where

import Ch02.Beside.Nat (Nat (Succ, Z))

-- | Return `True`, if one argument can be obtained from another with `Succ`
beside :: Nat -> Nat -> Bool
beside x y = Succ x == y || x == Succ y

-- | Return `True`, if `x` differs from `y` by `n`
besideN :: Nat -> Nat -> Nat -> Bool
besideN n x y = diff x y == n
 where
  diff Z y = y
  diff x Z = x
  diff (Succ x) (Succ y) = diff x y
