module BinaryTreeSearch where

data Tree a = Nil | Node (Tree a) a (Tree a) deriving (Show)

search :: Int -> (Tree Int) -> Bool
search _ Nil = False
search n (Node lft r rht)
  | n == r = True
  | otherwise = search n lft || search n rht
