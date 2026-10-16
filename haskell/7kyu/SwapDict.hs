module SwapDict where

import Data.Map (Map)
import Data.Map qualified as M

swapDict :: Map String String -> Map String [String]
swapDict = M.foldlWithKey (\acc k v -> M.insertWith (++) v [k] acc) M.empty
