module Existential (Showable (S)) where

data Showable = forall a. (Show a) => S a

instance Show Showable where
  show (S x) = show x
