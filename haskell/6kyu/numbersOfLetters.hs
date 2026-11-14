module NumbersOfLettersOfNumbers.Kata (numbersOfLetters) where

numbersOfLetters :: Int -> [String]
numbersOfLetters = go
 where
  go n
    | length m == n = [m]
    | otherwise = m : go (length m)
   where
    m = numToLetter n

numToLetter = concatMap f . show
 where
  f c = case c of
    '1' -> "one"
    '2' -> "two"
    '3' -> "three"
    '4' -> "four"
    '5' -> "five"
    '6' -> "six"
    '7' -> "seven"
    '8' -> "eight"
    '9' -> "nine"
    '0' -> "zero"
