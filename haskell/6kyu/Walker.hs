module Walker.Kata (solve) where

solve :: Int -> Int -> Int -> Int -> Int -> Int -> (Int, Int, Int, Int)
solve a b c alpha beta gamma =
  (dis, d, m, s)
 where
  pos = foldl (\pos (h, d) -> walk pos (fromIntegral h, fromIntegral d)) (0, 0) $ zip [a, b, c] [alpha, beta + 90, gamma + 180]
  dis = distance pos
  (d, m, s) = angleDMS pos

walk (x, y) (hypo, d) = (x + cos r * hypo, y + sin r * hypo)
 where
  r = radians d

radians d = d * pi / 180

distance (a, b) = round $ sqrt (a * a + b * b)

angleDMS (x, y) =
  let deg = atan2 y x * 180 / pi
      deg' = if deg < 0 then deg + 360 else deg
      d = floor deg'
      m = floor ((deg' - fromIntegral d) * 60)
      s = floor (((deg' - fromIntegral d) * 60 - fromIntegral m) * 60)
   in (d, m, s)
