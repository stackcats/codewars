module LengthLexicographic where

newtype LengthList a = LengthList [a]
  deriving (Show, Eq)

instance (Ord a) => Ord (LengthList a) where
  compare (LengthList x) (LengthList y)
    | lx < ly = LT
    | lx > ly = GT
    | otherwise = compare x y
   where
    lx = length x
    ly = length y
