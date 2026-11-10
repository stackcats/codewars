module Kata.ClockyMcClockFace (whatTimeIsIt) where

import Text.Printf

whatTimeIsIt :: Float -> String
whatTimeIsIt angle = printf "%02d:%02d" (if h' == 0 then 12 else h') m
 where
  ms :: Int
  ms = floor (angle / 0.5)

  (h, m) = ms `divMod` 60
  h' = h `mod` 12
