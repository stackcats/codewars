module Pillow where

pillow :: (String, String) -> Bool
pillow (a, b) = ps /= [] && any (`elem` fs) ps
 where
  f x = map fst . filter ((== x) . snd) . zip [0 ..]
  fs = f 'n' a
  ps = f 'B' b
