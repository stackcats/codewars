module VectorMapping (mapVector) where

type Vector = (Double, Double)
type Circle = (Double, Double, Double)

mapVector :: Vector -> Circle -> Circle -> Vector
mapVector (x, y) (cx1, cy1, r1) (cx2, cy2, r2) = (tx, ty)
 where
  dx = abs (x - cx1) * r2 / r1
  dy = abs (y - cy1) * r2 / r1
  tx = cx2 + if x < cx1 then -dx else dx
  ty = cy2 + if y < cy1 then -dy else dy
