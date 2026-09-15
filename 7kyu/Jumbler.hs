module Jumbler (jumbler) where

jumbler :: [Int] -> Int
jumbler = f 0
 where
  f ct (0 : _) = ct
  f ct xs@(i : _) = f (ct + 1) (rotate i xs)

rotate i xs =
  let x = xs !! i
   in x : (take i xs ++ drop (i + 1) xs)
