module HazardScanner (isHazardous, getLEDColour) where

isHazardous :: Int -> Int -> Bool
isHazardous b_elerium b_dilithium =
  b_dilithium < b_elerium && (b_elerium - b_dilithium) `rem` 2 == 1

getLEDColour :: Int -> Int -> String
getLEDColour b_elerium b_dilithium
  | HazardScanner.isHazardous b_elerium b_dilithium = "#FF0000"
  | otherwise = "#00FF00"
