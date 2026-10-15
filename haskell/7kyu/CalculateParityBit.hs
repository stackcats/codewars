module CalculateParityBit (checkParity) where

checkParity :: String -> String -> Int
checkParity parity bin
  | parity == "even" && odd ones = 1
  | parity == "odd" && even ones = 1
  | otherwise = 0
 where
  ones = length $ filter (== '1') bin
