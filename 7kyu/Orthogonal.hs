module Orthogonal where

isOrthogonal :: [Int] -> [Int] -> Bool
isOrthogonal xs = (== 0) . sum . map (uncurry (*)) . zip xs
