module RepeatSequenceLength (repeatSequenceLength) where

import Data.Char
import Data.List

repeatSequenceLength :: Int -> Int
repeatSequenceLength = go []
  where
    go xs n =
      case findIndex (== n) xs of
        Just i -> i + 1
        _ -> go (n : xs) m
      where
        m = sum . map ((^ 2) . digitToInt) $ show n
