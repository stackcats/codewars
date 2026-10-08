module ModularArithmetic (inverseMod) where

inverseMod :: Integer -> Integer -> Maybe Integer
inverseMod a n = loop 0 1 n a
 where
  loop t newt r newr
    | newr /= 0 = let q = r `div` newr in loop newt (t - q * newt) newr (r - q * newr)
    | r > 1 = Nothing
    | t < 0 = Just (t + n)
    | otherwise = Just t
