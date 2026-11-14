module Codewars.Kata.Harshad where

import Data.Char
import Data.Maybe

{- | Returns true if the given number is
  a avalid Harshad number.
-}
isValid :: Integer -> Bool
isValid 0 = False
isValid number = number `mod` (fromIntegral s) == 0
 where
  s = sum . map digitToInt $ show number

{- | Returns the next Harshad number
  _after_ the argument.

>>> getNext 1 `shouldBe` 2
-}
getNext :: Integer -> Integer
getNext = until isValid succ . succ

{- | Returns n Harshad numbers starting
  at start. If start is Nothing, start at 0.

  The start is excluded, e.g.

>>> getNext n `shouldBe` (head . getSerie 1 $ Just n)
>>> getNext 0 `shouldBe` (head . getSerie 1 Nothing)
-}
getSerie :: Int -> Maybe Integer -> [Integer]
getSerie n = take n . filter isValid . iterate succ . succ . fromMaybe 0
