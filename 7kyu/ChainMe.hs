module ChainMe (chain) where

chain :: x -> [x -> x] -> x
chain = foldl (\acc f -> f acc)
