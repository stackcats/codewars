module Clonewars where

clonewars :: Integer -> (Integer, Integer)
clonewars 0 = (1, 0)
clonewars n = (2 ^ (n - 1), f n 1)
 where
  f 1 ct = ct
  f n ct = n * ct + f (n - 1) (ct * 2)
