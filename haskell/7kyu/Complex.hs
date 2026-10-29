module Complex where

data Complex = Complex Double Double
  deriving (Eq, Show)

real, imaginary :: Complex -> Double
real (Complex r i) = r
imaginary (Complex r i) = i

-- You are not required to provide a full working instance
-- Only addition and multiplication will be tested
instance Num Complex where
  (+) (Complex a b) (Complex c d) = Complex (a + c) (b + d)
  (*) (Complex a b) (Complex c d) = Complex (a * c - b * d) (b * c + a * d)
  (-) = undefined
  negate = undefined
  abs = undefined
  signum = undefined
  fromInteger = undefined
