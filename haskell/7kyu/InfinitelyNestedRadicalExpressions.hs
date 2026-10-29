module InfinitelyNestedRadicalExpressions.Kata (fn) where

-- https://mathworld.wolfram.com/NestedRadical.html (12)
fn :: Double -> Double
fn = (/ 2) . succ . sqrt . succ . (* 4)
