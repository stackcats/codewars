module Codewars.Kata.Retsec where

reverseByCenter :: String -> String
reverseByCenter xs =
  let size = length xs
      (l, r) = splitAt (size `div` 2) xs
   in if size `mod` 2 == 0
        then r ++ l
        else drop 1 r ++ take 1 r ++ l
