module HighestValuePyramid (pyramid) where

import Data.List

pyramid :: [Int] -> Maybe Int
pyramid = go 3 . group . sort
 where
  go 0 _ = Just 0
  go n xs =
    case filter ((>= n) . length) xs of
      [] -> Nothing
      ys ->
        let t = (* n) $ head $ last ys
         in fmap (+ t) $ go (n - 1) (xs \\ [last ys])
