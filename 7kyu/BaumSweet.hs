module BaumSweet (baumSweet) where

import Data.Function
import Data.List
import Text.Printf

baumSweet :: [Int]
baumSweet = map f [0 ..]

f :: Int -> Int
f 0 = 1
f n =
  (printf "%b" n :: String)
    & group
    & filter ((== '0') . head)
    & all (even . length)
    & (\b -> if b then 1 else 0)
