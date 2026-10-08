module Flush where

import Data.List

isFlush :: [String] -> Bool
isFlush = (== 1) . length . group . map last
