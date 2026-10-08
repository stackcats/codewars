module NoSpace (spacey) where

spacey :: [String] -> [String]
spacey = scanl1 (++)
