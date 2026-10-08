module OddCubed.JorgeVS.Kata where

import Data.Bool

oddCubed :: [Int] -> Int
oddCubed = sum . concatMap (\n -> bool [] [n ^ 3] $ odd n)
