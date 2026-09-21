module Powers (powers) where

import Text.Printf

powers :: Int -> [Int]
powers = concatMap (\(i, c) -> if c == '1' then [2 ^ i] else []) . zip [0 ..] . reverse . printf "%b"
