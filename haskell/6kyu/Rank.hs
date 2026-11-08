odule Codewars.G964.Rank where

import Data.Char
import Data.List
import Data.List.Split
import Data.Ord

rank :: [Char] -> [Int] -> Int -> [Char]
rank "" _ _ = "No participants"
rank s we n = go (splitOn "," s) we n

go st we n
  | n > (length st) = "Not enough participants"
  | otherwise = fst $ xs !! (n - 1)
  where
    xs = sortBy (comparing (Down . snd) <> comparing fst) $ zipWith (\w (s, n) -> (s, n * w)) we $ map f st
    f s = (s, som s)

som = (+) <$> length <*> sum . map ((subtract 96) . ord . toLower)
  
