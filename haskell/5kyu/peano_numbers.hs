module Haskell.Codewars.Peano where
import Prelude hiding (even, odd, div, compare, Num, Int, Integer, Float, Double, Rational, Word)

data Peano = Zero | Succ Peano deriving (Eq, Show)

add, sub, mul, div :: Peano -> Peano -> Peano
-- Addition
add Zero n = n
add m Zero = m
add (Succ m) n = Succ (add m n)
-- Subtraction
sub Zero Zero = Zero
sub m Zero = m
sub Zero _ = error "negative number"
sub (Succ m) (Succ n) = sub m n
-- Multiplication
mul _ Zero = Zero
mul Zero _ = Zero
mul m (Succ Zero) = m
mul m (Succ n) = add m (mul m n)
-- Integer division
div _ Zero = error "divide by 0"
div Zero _ = Zero
div m (Succ Zero) = m
div m n 
  | m `compare` n == LT = Zero
  | otherwise = Succ (div (sub m n) n)

even, odd :: Peano -> Bool
-- Even
even Zero = True
even (Succ n) = odd n
-- Odd
odd Zero = False
odd (Succ Zero) = True
odd (Succ n) = even n

compare :: Peano -> Peano -> Ordering
-- Compare
compare Zero Zero = EQ
compare Zero _ = LT
compare _ Zero = GT
compare (Succ m) (Succ n) = compare m n
