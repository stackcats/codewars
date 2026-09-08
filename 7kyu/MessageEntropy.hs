module MessageEntropy (entropy) where

import Data.Char
import Data.Map qualified as M

entropy :: String -> Double
entropy s =
  let t = filter (not . isSpace) s
      mp = foldl (\mp c -> M.insertWith (+) c 1 mp) M.empty t
      size = length t
      values = M.elems mp
   in foldl (\acc ct -> acc - (shannon ct size)) 0 values

shannon :: Int -> Int -> Double
shannon ct size =
  let v = (fromIntegral ct) / (fromIntegral size)
   in logBase 2 v * v
