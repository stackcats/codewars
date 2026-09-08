module Codewars.Kata.Challenge (noRepeat) where

import Data.List
import Data.Map qualified as M
import Data.Maybe

noRepeat :: String -> Char
noRepeat s =
  let mp = foldl (\acc c -> M.insertWith (+) c 1 acc) M.empty s
   in fromJust $ find (\c -> M.lookup c mp == Just 1) s
