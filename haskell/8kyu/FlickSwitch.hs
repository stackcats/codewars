module FlickSwitch (flickSwitch) where

flickSwitch :: [String] -> [Bool]
flickSwitch =
  reverse . fst . foldl f ([], True)
 where
  f (acc, b) "flick" = (not b : acc, not b)
  f (acc, b) _ = (b : acc, b)
