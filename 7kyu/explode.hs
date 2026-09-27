module Kata (explode) where

import Data.Char

explode :: String -> String
explode = concatMap (\c -> replicate (digitToInt c) c)
