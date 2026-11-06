module CountDeafRats where

import Data.Char
import Data.List.Split

countDeafRats :: String -> Int
countDeafRats s = count "O~" l + count "~O" (tail r)
 where
  (l, r) = break (== 'P') $ filter (not . isSpace) s
  count t = length . filter (== t) . chunksOf 2
