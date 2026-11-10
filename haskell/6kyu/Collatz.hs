module Collatz where

import Data.List

collatz :: Int -> String
collatz 1 = "1"
collatz n = (<> "->1") . intercalate "->" . map show . takeWhile (/= 1) $ iterate (\x -> if even x then x `div` 2 else 3 * x + 1) n
