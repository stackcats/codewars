module SimpleLetterRemoval where

import Data.Bool
import Data.List
import Data.Map qualified as M

solve :: [Char] -> Int -> [Char]
solve xs k = go xs mp
 where
  mp = foldl (\acc n -> M.insertWith (+) n 1 acc) M.empty $ take k $ sort xs

go [] _ = []
go (x : xs) mp =
  case mp M.!? x of
    Nothing -> x : (go xs mp)
    Just n -> go xs (M.update (\v -> bool (Just $ n - 1) Nothing (n == 1)) x mp)
