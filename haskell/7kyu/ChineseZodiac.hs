module ChineseZodiac where

import Preloaded (animals, elements)

chineseZodiac :: Int -> String
chineseZodiac year = elements !! ((year - 1924) `mod` 10 `div` 2) ++ " " ++ animals !! ((year - 1924) `mod` 12)
