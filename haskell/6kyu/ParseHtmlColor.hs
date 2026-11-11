module Codewars.Lambda4fun.ParseHtmlColor where

import Codewars.Lambda4fun.ParseHtmlColor.PresetColors (presetColors)
import Data.Char
import Data.List.Split
import Data.Map.Strict (Map, fromList, (!))
import Numeric

parseHtmlColor :: String -> Map Char Int
parseHtmlColor color@(x : xs)
  | x == '#' && length xs == 6 = f xs
  | x == '#' = f $ concatMap (\c -> [c, c]) xs
  | otherwise = f . tail . (presetColors !) $ map toLower color

f = fromList . zip "rgb" . map (fst . head . readHex) . chunksOf 2
