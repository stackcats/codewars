module Gift where

import Data.List
import Data.Map qualified as M
import Data.Maybe

buy :: (Num a, Eq a, Ord a) => a -> [a] -> Maybe (Int, Int)
buy c = listToMaybe . sortOn fst . fst . foldr f ([], M.empty) . zip [0 ..]
 where
  f (i, n) (lst, mp) =
    case mp M.!? (c - n) of
      Just j -> ((i, j) : lst, M.insert n i mp)
      _ -> (lst, M.insert n i mp)
