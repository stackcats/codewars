module StringTransformer where

import Data.Char
import Data.List.Split

stringTransformer :: String -> String
stringTransformer = concat . reverse . map (map f) . (split . dropFinalBlank . condense $ whenElt isSpace)
 where
  f c
    | isLower c = toUpper c
    | otherwise = toLower c
