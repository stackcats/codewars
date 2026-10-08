module Pillars where

pillars :: Int -> Int -> Int -> Int
pillars 1 _ _ = 0
pillars n d w = (n - 1) * d * 100 + (n - 2) * w
