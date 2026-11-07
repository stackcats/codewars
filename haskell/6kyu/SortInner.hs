module SortInner (sortTheInnerContent) where

import Data.List
import Data.Ord

sortTheInnerContent :: String -> String
sortTheInnerContent = unwords . map f . words
 where
  f s@(a : b : c : d : _) = [head s] <> (sortOn Down $ tail $ init s) <> [last s]
  f s = s
