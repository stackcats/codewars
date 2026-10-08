module Bumps where

import Data.Bool

bump :: String -> String
bump = bool "Car Dead" "Woohoo!" . (<= 15) . length . filter (== 'n')
