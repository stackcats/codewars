module CoinFlips (checkSequence) where

import Data.List

checkSequence :: String -> Int -> Int -> Bool
checkSequence sequence l n = (== n) $ length $ filter ((== l) . length) $ group sequence

