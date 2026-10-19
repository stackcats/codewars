module NumberIncreasing (numberIncreasing) where

import Control.Monad.State
import Data.Map.Strict qualified as Map

numberIncreasing :: Int -> Bool
numberIncreasing n = evalState (go n) mempty
 where
  go n
    | n < 1 = return False
    | n == 1 = return True
    | otherwise = do
        cached <- gets $ Map.lookup n
        case cached of
          Just x -> return x
          Nothing -> do
            a <- if n `mod` 3 == 0 then go (n `div` 3) else return False
            b <- go (n - 5)
            let ans = a || b
            withState (Map.insert n ans) (pure ans)
