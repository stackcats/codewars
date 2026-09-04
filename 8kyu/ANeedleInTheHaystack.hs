module ANeedleInTheHaystack (findNeedle) where

import Data.List
import Data.Maybe

findNeedle :: [String] -> String
findNeedle xs =
  let p = fromMaybe 0 $ elemIndex "needle" xs
   in "found the needle at position " ++ show p
