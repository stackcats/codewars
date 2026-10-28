module Gravity where

import Data.List

switchGravity :: [String] -> [String]
switchGravity lst = transpose . map (\n -> replicate (h - n) '-' ++ replicate n '#') . map (length . filter (== '#')) $ transpose lst
  where h = length lst
