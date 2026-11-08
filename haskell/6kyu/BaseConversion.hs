module BaseConversion where

import Data.List
import Data.Maybe

newtype Alphabet = Alphabet {getDigits :: [Char]} deriving (Show)

convert :: Alphabet -> Alphabet -> String -> String
convert (Alphabet a) (Alphabet b) x
  | n == 0 = [b !! 0]
  | otherwise = go n
 where
  size = genericLength a
  n :: Integer
  n = foldl (\acc c -> acc * size + (fromIntegral $ fromJust $ findIndex (== c) a)) 0 x
  size2 = genericLength b

  go 0 = ""
  go x = (go d) <> [b !! (fromIntegral m)]
   where
    (d, m) = x `divMod` size2
