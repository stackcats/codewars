{-# LANGUAGE LambdaCase #-}

module InsaneColouredTriangles (triangle) where

import Data.Bool
import Data.Vector.Unboxed as V

triangle :: Vector Char -> Char
triangle v =
  toChar $
    negateIfOdd (n - 1) $
      V.ifoldl'
        ( \acc i x ->
            (acc + binomMod3 (n - 1) i * fromChar x) `mod` 3
        )
        0
        v
 where
  n = V.length v

fromChar :: Char -> Int
fromChar = \case
  'R' -> 0
  'G' -> 1
  'B' -> 2

toChar :: Int -> Char
toChar = \case
  0 -> 'R'
  1 -> 'G'
  2 -> 'B'

negateIfOdd :: Int -> Int -> Int
negateIfOdd k x = bool x ((-x) `mod` 3) (odd k)

binomMod3 :: Int -> Int -> Int
binomMod3 n k = go n k
 where
  go 0 0 = 1
  go 0 _ = 0
  go n k
    | kr > nr = 0
    | otherwise = binomSmall nr kr * go n' k'
   where
    (n', nr) = n `divMod` 3
    (k', kr) = k `divMod` 3

binomSmall :: Int -> Int -> Int
binomSmall 0 0 = 1
binomSmall 1 0 = 1
binomSmall 1 1 = 1
binomSmall 2 0 = 1
binomSmall 2 1 = 2
binomSmall 2 2 = 1
binomSmall _ _ = 0
