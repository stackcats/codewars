module Codewars.Kata.GlassDoor where

import Data.List

stepThroughWith :: String -> Bool
stepThroughWith = any ((>= 2) . length) . group
