module Polynomial (evaluate) where

evaluate :: (Num a) => [a] -> a -> a
evaluate coefficients x =
  fst $ foldr (\c (acc, p) -> (acc + c * p, p * x)) (0, 1) coefficients
