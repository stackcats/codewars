module Haskell.Codewars.Pattern where

import Data.List

pattern :: Int -> String
pattern n = intercalate "\n" $ map fst $ take n $ iterate (\(s, n) -> (s ++ show n, pred n)) (show n, pred n)
