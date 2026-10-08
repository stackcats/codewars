module Pak where

import Data.List

pak :: String -> String
pak = intercalate " pak " . words
