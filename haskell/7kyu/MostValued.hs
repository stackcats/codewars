module MostValued where

import Data.List
import Data.Ord

solve :: String -> Char
solve xs = fst $ maximumBy (comparing snd <> comparing (Down . fst)) ys
 where
  ys = (zip <$> id <*> map f) $ nub xs
  f = ((-) <$> last <*> head) . (`findIndices` xs) . (==)
