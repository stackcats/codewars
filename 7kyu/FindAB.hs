module FindAB where

import Data.Map qualified as M
import Data.Maybe

findAB :: [Int] -> Int -> Maybe (Int, Int)
findAB xs t = f xs
 where
  mp = foldl (\acc x -> M.insertWith (+) x 1 acc) M.empty xs

  f [] = Nothing
  f [_] = Nothing
  f (0 : xs) = if t == 0 then Just (0, head xs) else f xs
  f (x : xs)
    | t `rem` x /= 0 = f xs
    | y == x = if fromJust (M.lookup x mp) > 1 then Just (x, x) else f xs
    | otherwise = if M.member y mp then Just (x, y) else f xs
   where
    y = t `div` x
