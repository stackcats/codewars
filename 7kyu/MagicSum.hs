module MagicSum where

magicSum :: [Int] -> Int
magicSum = sum . filter isMagic

isMagic n = odd n && '3' `elem` (show n)
