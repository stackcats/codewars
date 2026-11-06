module A9n (abbreviate) where

import Data.Char
import Data.List.Split
import Text.Printf

abbreviate :: String -> String
abbreviate = concat . map f . (split . dropFinalBlank . condense . whenElt) (not . isAlpha)
 where
  f s
    | length s < 4 = s
    | any (not . isAlpha) s = s
    | otherwise = printf "%c%d%c" (head s) (length s - 2) (last s)
