module WeIrDStRiNgCaSe where

import Data.Char

toWeirdCase :: String -> String
toWeirdCase = unwords . map f . words
 where
  f = zipWith (\i c -> if even i then toUpper c else toLower c) [0 ..]
