module Pangram where

import Data.Char

isPangram :: String -> Bool
isPangram s = all (`elem` t) ['a' .. 'z']
 where
  t = map toLower s
