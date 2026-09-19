module Codewars.G964.Rotations where

containAllRots :: String -> [String] -> Bool
containAllRots "" _ = True
containAllRots s arr = all (`elem` arr) $ scanl (\acc _ -> rot acc) s [1 .. length s - 1]

rot s = drop 1 s ++ take 1 s
