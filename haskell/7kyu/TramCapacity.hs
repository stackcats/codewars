module TramCapacity where

tram :: Int -> [Int] -> [Int] -> Int
tram stops = (.) (maximum . scanl1 (+) . take stops) . zipWith (flip (-))
