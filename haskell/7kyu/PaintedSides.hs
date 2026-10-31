module PaintedSides (paintedFaces) where

paintedFaces :: Int -> Int -> Int
paintedFaces 0 _ = 0
paintedFaces 1 n =
  case n of
    6 -> 1
    _ -> 0
paintedFaces l n =
  case n of
    0 -> (l - 2) ^ 3
    1 -> (l - 2) ^ 2 * 6
    2 -> (l - 2) * 12
    3 -> 8
    _ -> 0
