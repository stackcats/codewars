module CaseSensitive where

caseSensitive :: String -> (Bool, String)
caseSensitive xs = (null ys, ys)
 where
  ys = filter (`notElem` ['a' .. 'z']) xs
