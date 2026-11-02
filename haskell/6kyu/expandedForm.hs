module Kata where

import Data.List

expandedForm :: Int -> String
expandedForm n = intercalate " + " $ map show $ filter (/= 0) $ map (\x -> n `div` x `mod` 10 * x) $ reverse $ takeWhile (<= n) $ iterate (* 10) 1
