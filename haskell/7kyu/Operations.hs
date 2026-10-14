module Operations where

import Data.Bool

calc :: [Int] -> Int
calc = sum . f . g . map (\x -> bool x (x ^ 2) (x > 0))

g (a : b : c : xs) = a : b : (c * 3) : g xs
g xs = xs

f (a : b : c : d : e : xs) = a : b : c : d : (-e) : f xs
f xs = xs
