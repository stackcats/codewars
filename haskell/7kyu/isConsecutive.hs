module Repeated (isConsecutive) where

import Data.List

isConsecutive :: String -> Bool
isConsecutive = ((==) <$> id <*> nub) . map head . group
