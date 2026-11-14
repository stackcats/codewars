module Codewars.Kata.CubicNumbers where

import Codewars.Kata.CubicNumbers.Types

import Data.Char
import Data.List.Split

-- data Lucky = Lucky [Int] Int
--   deriving (Eq, Show)

sumOfCubes :: String -> Maybe Lucky
sumOfCubes s = case filter isCubic . map read . concatMap (chunksOf 3) $ wordsBy (not . isDigit) s of
  [] -> Nothing
  xs -> Just $ Lucky xs $ sum xs

isCubic = (==) <*> sum . map ((^ 3) . digitToInt) . show
