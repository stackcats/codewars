module Vaporcode where

import Data.Char
import Data.List

vaporcode :: String -> String
vaporcode = intercalate "  " . map ((: []) . toUpper) . filter (/= ' ')
