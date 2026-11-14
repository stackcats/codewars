module Kata where

import Data.List

isOddHeavy :: [Int] -> Bool
isOddHeavy xs =
  case partition even xs of
    (_, []) -> False
    ([], _) -> True
    (l, r) -> minimum r > maximum l
