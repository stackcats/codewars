module SearchForLetters (search) where

import Data.Char

search :: String -> String
search s = map (\c -> if c `elem` s || toUpper c `elem` s then '1' else '0') ['a' .. 'z']
