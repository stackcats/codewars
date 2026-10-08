module ThreeAndTwo where

import Data.List

checkThreeAndTwo :: [Char] -> Bool
checkThreeAndTwo = (== [2, 3]) . sort . map length . group . sort
