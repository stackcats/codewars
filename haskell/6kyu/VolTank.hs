module Codewars.G964.VolTank where

tankvol :: Int -> Int -> Int -> Int
tankvol h' d' vt' = floor $ v * vt
 where
  xs :: [Double]
  xs@[h, d, vt] = map fromIntegral [h', d', vt']

  r = d / 2

  theta = acos $ 1 - h / r

  v = (theta - sin theta * cos theta) / pi
