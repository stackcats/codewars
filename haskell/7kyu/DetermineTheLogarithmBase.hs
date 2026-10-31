module DetermineTheLogarithmBase.Kata (guessBase) where

guessBase :: (Floating a) => (a -> a) -> a
guessBase log = exp (1 / log (exp 1))
