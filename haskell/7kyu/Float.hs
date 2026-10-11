module Float where

solution :: Float -> Float
solution n = (fromIntegral $ floor (n * 100 + 0.5)) / 100
