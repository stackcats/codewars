module Blue where

guessBlue :: Int -> Int -> Int -> Int -> Double
guessBlue b r b2 r2 = fromIntegral (b - b2) / fromIntegral (b + r - b2 - r2)
