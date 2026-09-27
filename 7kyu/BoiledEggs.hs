module BoiledEggs where

cookingTime :: Integer -> Integer
cookingTime = (* 5) . ceiling . (/ 8) . fromIntegral
