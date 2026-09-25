module SF176 where

import Data.Char

reverseLetter :: String -> String
reverseLetter = filter isAlpha . reverse
