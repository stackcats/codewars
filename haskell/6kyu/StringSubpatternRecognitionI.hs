module StringSubpatternRecognitionI (hasSubpattern) where

import Data.List.Split

hasSubpattern :: String -> Bool
hasSubpattern s = any f [1 .. length s `div` 2]
 where
  f i = all (== x) xs
   where
    (x : xs) = chunksOf i s
