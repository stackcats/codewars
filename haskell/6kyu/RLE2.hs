module Kata.RLE (encode, decode) where

import Data.Char
import Data.List
import Data.List.Split

encode :: String -> String
encode = concatMap ((<>) <$> show . length <*> take 1) . group

decode :: String -> String
decode = concatMap (\[n, c] -> take (read n) $ cycle c) . chunksOf 2 . (split . dropInitBlank . condense $ whenElt isDigit)
