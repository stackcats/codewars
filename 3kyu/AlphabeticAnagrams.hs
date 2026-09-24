module AlphabeticAnagrams where

import Data.List
import Data.Map.Strict qualified as M

lexiPos :: String -> Integer
lexiPos word = go word (sort word) 1
 where
  go [] _ res = res
  go (w : ws) arr res =
    let ndx = case elemIndex w arr of
          Just i -> i
          Nothing -> error "character not found"

        len = length arr

        contribution =
          fac (fromIntegral len)
            * fromIntegral ndx
            `div` repeat' arr
            `div` fromIntegral len

        arr' = removeAt ndx arr
     in go ws arr' (res + contribution)

fac :: Integer -> Integer
fac n = product [1 .. n]

repeat' :: String -> Integer
repeat' iter =
  product
    [ fac (fromIntegral n)
    | n <- M.elems counts
    ]
 where
  counts = M.fromListWith (+) [(c, 1 :: Int) | c <- iter]

removeAt :: Int -> [a] -> [a]
removeAt i xs = take i xs ++ drop (i + 1) xs
