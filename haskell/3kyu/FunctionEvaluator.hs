module FunctionEvaluator where

import Control.Monad.State.Strict
import Data.Map.Strict qualified as Map

evaluateFunction :: (Ord a) => (a -> Either b ([a], [b] -> b)) -> a -> b
evaluateFunction f n = evalState (go n) Map.empty
 where
  go x = do
    cache <- get
    case Map.lookup x cache of
      Just y -> pure y
      Nothing -> do
        y <- case f x of
          Left y -> pure y
          Right (xs, fn) -> fn <$> mapM go xs

        withState (Map.insert x y) (pure y)
