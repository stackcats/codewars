module SpinningRings (spinningRings) where

spinningRings :: Int -> Int -> Int
spinningRings innerMax outerMax = f innerMax 1
 where
  f a b
    | a == b = 1
    | otherwise = 1 + f (r a (-1) innerMax) (r b 1 outerMax)

  r a b c = (a + b + c + 1) `rem` (c + 1)
