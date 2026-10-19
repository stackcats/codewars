module BinaryRepresentation (showBits) where

import Data.Bits
import Data.Int (Int32)
import Text.Printf

showBits :: Int32 -> [Int32]
showBits n = go (n < 0) xs
 where
  xs = map (\c -> if c == '1' then 1 else 0) $ printf "%032b" $ abs n

  go True xs = add1 $ map (`xor` 1) xs
  go False xs = xs

  add1 xs = fst $ foldr f ([], 1) xs
   where
    f c (acc, p) =
      let (d, r) = (c + p) `divMod` 2
       in (r : acc, d)
