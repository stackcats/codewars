module Gravity (solution) where

g = 6.67 * 10 ** (-11)

solution :: [Double] -> [String] -> Double
solution [m1, m2, r] [u1, u2, u3] =
  g * a * b / (c ^ 2)
 where
  a = toKG u1 m1
  b = toKG u2 m2
  c = toM u3 r

toKG :: String -> Double -> Double
toKG "g" n = n / 1000
toKG "mg" n = n / 1000000
toKG "μg" n = n / 1000000000
toKG "lb" n = n * 0.453592
toKG _ n = n

toM :: String -> Double -> Double
toM "cm" n = n / 100
toM "mm" n = n / 1000
toM "μm" n = n / 1000000
toM "ft" n = n * 0.3048
toM _ n = n
