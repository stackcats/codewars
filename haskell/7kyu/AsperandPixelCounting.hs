module AsperandPixelCounting (countPixels) where

countPixels :: Int -> Int
countPixels 1 = 11
countPixels n = 8 * n + 2
