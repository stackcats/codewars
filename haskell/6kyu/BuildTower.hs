module Codewars.BuildTower where

buildTower :: Int -> [String]
buildTower n = foldr f [] [1 .. n]
 where
  f x acc = (spaces <> stars <> spaces) : acc
   where
    spaces = replicate (n - x) ' '
    stars = replicate (x * 2 - 1) '*'
