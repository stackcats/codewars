module Codewars.Kata.Coins where

adjust :: Int -> Int -> Int
adjust coin price = until (\x -> x `mod` coin == 0) succ price
