module MultiplyAdjacentDigits (digitMultiplication) where

import Data.Char
import Data.List.Split

digitMultiplication :: String -> Integer
digitMultiplication s = go st ops
 where
  st = map (product . map digitToInt) $ splitOneOf "-+" s
  ops = filter (`elem` "+-") s
  go st [] = fromIntegral $ head st
  go (a : b : st) (op : ops) =
    case op of
      '-' -> go ((a - b) : st) ops
      '+' -> go ((a + b) : st) ops
