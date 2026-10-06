module ProductOrSum (productOrSum) where

import Data.List
import ProductOrSum.Preloaded (ProductOrSum (..))

productOrSum :: [Int] -> Int -> ProductOrSum
productOrSum xs n
  | a == b = Same
  | a > b = Product
  | otherwise = Sum
 where
  ys = sort xs
  a = product $ take n ys
  b = sum $ take n $ reverse ys
