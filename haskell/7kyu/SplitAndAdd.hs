module SplitAndAdd (solve) where

import Control.Monad.State
import Data.Map.Strict qualified as Map

solve :: Integer -> Integer -> Integer
solve x y = evalState (go x) mempty
  where
    go x
      | x == 0 = return 0
      | x == 1 = return 1
      | otherwise = do
        cache <- gets $ Map.lookup x
        case cache of
          Just v -> return v
          Nothing -> do
            let m = x `div` 2
                n = x - m
            am <- go m
            an <- go n
            let t = am + an + y * m * n
            withState (Map.insert x t) (pure t)
