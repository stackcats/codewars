module SpeedOfLetters where

import Data.Char
import Data.Map qualified as M
import Data.Maybe

speedify :: String -> String
speedify "" = ""
speedify st = [fromMaybe ' ' $ M.lookup i mp | i <- [0 .. size]]
 where
  mp = foldl (\mp (c, i) -> M.insert (i + ord c - ord 'A') c mp) mempty $ zip st [0 ..]
  Just (size, _) = M.lookupMax mp
