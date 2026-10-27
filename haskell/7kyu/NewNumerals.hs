module NewNumerals where

newNumeralSystem :: Char -> [String]
newNumeralSystem = go 'A'
 where
  go a b
    | a > b = []
    | otherwise = ([a] ++ " + " ++ [b]) : go (succ a) (pred b)
