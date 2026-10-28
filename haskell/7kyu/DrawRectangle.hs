module DrawRectangle where

type Pixel = Char
type Canvas = [[Pixel]]
type Point = (Int, Int)
type Rectangle = (Point, Point)

drawRectangle :: Canvas -> Rectangle -> Canvas
drawRectangle canvas ((x1, y1), (x2, y2)) = map f $ zip [0 ..] canvas
 where
  f (i, row) = map (f2 i) $ zip [0 ..] row
  f2 j (i, c)
    | (i, j) `elem` [(x1, y1), (x2, y2), (x1, y2), (x2, y1)] = '*'
    | j `elem` [y1, y2] && i > x1 && i < x2 = '-'
    | i `elem` [x1, x2] && j > y1 && j < y2 = '|'
    | otherwise = c
