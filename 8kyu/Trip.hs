module Trip (zeroFuel) where

zeroFuel :: Int -> Int -> Int -> Bool
zeroFuel distanceToPump mpg fuelLeft = distanceToPump <= mpg * fuelLeft
