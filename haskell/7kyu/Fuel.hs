module Fuel where

mpg_lp100km :: Double -> Double
mpg_lp100km x = r2 (235.214583 / x)

lp100km_mpg :: Double -> Double
lp100km_mpg x = r2 (235.214583 / x)

r2 x = fromInteger (round (x * 100)) / 100
