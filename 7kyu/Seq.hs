module Seq where

import Data.Char
import Data.List

alphaSeq :: String -> String
alphaSeq = intercalate "," . map f . sort . map toLower
 where
  f c = toUpper c : replicate (ord c - ord 'a') c
