module PianoNrOne.JorgeVS.Kata where

blackOrWhiteKey :: Int -> String
blackOrWhiteKey n
  | ((n - 1) `mod` 88 + 1) `mod` 12 `elem` [0, 2, 5, 7, 10] = "black"
  | otherwise = "white"
