module LikesVsDislikes (likeOrDislike) where

import Preloaded -- Like = Like | Dislike

likeOrDislike :: [Like] -> Maybe Like
likeOrDislike = foldl f Nothing . map Just
 where
  f x y
    | x == y = Nothing
    | y == Nothing = x
    | otherwise = y
