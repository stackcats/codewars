module AscendingSequences (solve) where

import Control.Monad.State
import Data.Map.Strict qualified as Map

solve :: Int -> Int
solve n = succ $ evalState (go n) mempty
 where
  go 1 = return 0
  go n = do
    cache <- gets $ Map.lookup n
    case cache of
      Just v -> return v
      Nothing -> do
        xs <- mapM go [1 .. n `div` 2]
        let v = sum xs + (n `div` 2)
        withState (Map.insert n v) (pure v)
