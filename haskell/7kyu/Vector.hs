module Vector (magnitude) where

magnitude :: [Double] -> Double
magnitude = sqrt . sum . map (^ 2)
