module Kata where

import Data.Function

remove :: String -> String
remove s =
  reverse s
    & dropWhile (== '!')
    & reverse
