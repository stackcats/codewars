module Removing (removeEveryOther) where

removeEveryOther :: [a] -> [a]
removeEveryOther [] = []
removeEveryOther [x] = [x]
removeEveryOther (x : _ : xs) = x : removeEveryOther xs
