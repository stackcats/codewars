module FunctionApplication (($$), ($$$)) where

infixr 1 $$
($$) :: (a -> b) -> a -> b
f $$ x = f x

infixr 2 $$$
($$$) :: (a -> b) -> a -> b
f $$$ x = f x
