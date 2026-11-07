module WhereIsMyParent (findChildren) where

import Data.Char
import Data.List

findChildren :: String -> String
findChildren = concatMap (\(x : xs) -> toUpper x : xs) . group . sort . map toLower
