module SimpleDirections where

import Data.Char
import Data.List
import Data.Maybe

solve :: [String] -> [String]
solve = reverse . fst . foldr f ([], "Begin")
 where
  f s (lst, op) = ((op ++ desc) : lst, opposite newOp)
   where
    (newOp, desc) = splitAt (fromMaybe 0 $ findIndex isSpace s) s
    opposite "Left" = "Right"
    opposite "Right" = "Left"
