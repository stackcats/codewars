module Packing (arrayPacking) where

import Text.Printf

arrayPacking :: [Integer] -> Integer
arrayPacking = foldl (\acc n -> read [n] + acc * 2) 0 . concatMap (printf "%08b" :: Integer -> String) . reverse
