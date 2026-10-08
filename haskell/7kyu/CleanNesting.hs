module CleanNesting (isCleanlyNested) where

import Preloaded (Tree (..), prettyTree)

{- -- from Preloaded
newtype Tree = T [Tree] deriving (Show, Eq)

prettyTree :: Tree -> String
-}

isCleanlyNested :: Tree -> Bool
isCleanlyNested (T xs)
  | xs == [] = True
  | all ((== "[]") . prettyTree) xs = True
  | any ((== "[]") . prettyTree) xs = False
  | otherwise = all isCleanlyNested xs
