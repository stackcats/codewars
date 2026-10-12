module CountingValleys (valleys) where

import Data.Bool

valleys :: String -> Int
valleys = fst . foldl f (0, 0)
 where
  f (ct, lv) c =
    case c of
      'D' -> (ct, lv - 1)
      'U' -> (ct + bool 0 1 (lv == -1), lv + 1)
      'F' -> (ct, lv)
