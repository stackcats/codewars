module Codewars.Commas where

import Data.List
import Data.List.Split

groupByCommas :: Int -> String
groupByCommas = intercalate "," . reverse . map reverse . chunksOf 3 . reverse . show
