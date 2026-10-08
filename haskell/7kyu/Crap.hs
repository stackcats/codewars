module Crap (crap) where

crap :: [String] -> Int -> Int -> String
crap garden bags cap
  | d > 0 = "Dog!!"
  | c <= bags * cap = "Clean"
  | otherwise = "Cr@p"
 where
  f (d, c) x = case x of
    'D' -> (succ d, c)
    '@' -> (d, succ c)
    _ -> (d, c)

  (d, c) = foldl f (0, 0) $ concat garden
