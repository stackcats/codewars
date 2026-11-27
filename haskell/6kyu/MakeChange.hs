module MakeChange (Change (..), makeChange) where

data Change = Change
  { h :: Int
  , q :: Int
  , d :: Int
  , n :: Int
  , p :: Int
  }
  deriving (Eq, Show)

makeChange :: Int -> Change
makeChange = go (Change{h = 0, q = 0, d = 0, n = 0, p = 0})
 where
  go c x
    | x == 0 = c
    | x >= 50 = go (c{h = x `div` 50}) (x `mod` 50)
    | x >= 25 = go (c{q = x `div` 25}) (x `mod` 25)
    | x >= 10 = go (c{d = x `div` 10}) (x `mod` 10)
    | x >= 5 = go (c{n = x `div` 5}) (x `mod` 5)
    | otherwise = c{p = x}
