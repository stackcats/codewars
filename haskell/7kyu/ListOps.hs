module ListOps where

import Prelude hiding (head, init, last, tail)

head :: [a] -> a
head (x : _) = x

tail :: [a] -> [a]
tail (_ : xs) = xs

init :: [a] -> [a]
init [_] = []
init (x : xs) = x : init xs

last :: [a] -> a
last [x] = x
last (_ : xs) = last xs
