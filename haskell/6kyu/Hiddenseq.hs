module Codewars.G964.Hiddenseq where

import Control.Monad.State
import Data.Map.Strict qualified as Map

fcn :: Integer -> Integer
fcn n = evalState (go n) mempty
 where
  go 0 = return 1
  go 1 = return 2
  go n = do
    cached <- gets $ Map.lookup n
    case cached of
      Just v -> return v
      Nothing -> do
        a <- go (n - 2)
        b <- go (n - 1)
        let v = 6 * a * b `div` (5 * a - b)
        withState (Map.insert n v) (pure v)
