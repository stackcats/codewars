module IsHappy where

import Data.Char
import Data.Set qualified as Set

isHappy :: Integer -> Bool
isHappy n = go n mempty
 where
  go 1 _ = True
  go n st =
    let m = next n
     in if Set.member m st
          then False
          else go m $ Set.insert m st

next :: Integer -> Integer
next = fromIntegral . sum . map ((^ 2) . digitToInt) . show
