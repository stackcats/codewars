module ExpandString (expand) where

import Data.Char

expand :: String -> String
expand = concatMap (\c -> replicate (ord (toLower c) - ord 'a' + 1) c) . filter ((&&) <$> isAscii <*> isAlpha)
