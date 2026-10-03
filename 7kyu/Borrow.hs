module Borrow where

import Data.Char

borrow :: String -> String
borrow = filter (`elem` ['a' .. 'z']) . map toLower
