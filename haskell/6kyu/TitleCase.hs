module TitleCase (titleCase) where

import Data.Char

titleCase :: String -> String -> String
titleCase _ "" = ""
titleCase minor title = unwords $ go (words $ map toLower minor) (words $ map toLower title)
 where
  go ys (x : xs) = cap x : map (\t -> if t `elem` ys then map toLower t else cap t) xs

  cap (x : xs) = toUpper x : map toLower xs
