module DuckShoot where

duckShoot :: Int -> Float -> String -> String
duckShoot ammo aim ducks = go ct ducks
 where
  ct = floor $ fromIntegral ammo * aim
  go n [] = []
  go 0 xs = xs
  go n ('2' : xs) = 'X' : go (n - 1) xs
  go n (x : xs) = x : go n xs
