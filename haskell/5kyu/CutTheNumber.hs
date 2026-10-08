module CutTheNumber.Kata (cut) where

import Control.Monad.State
import Data.Map.Strict qualified as Map

type Cache = Map.Map (String, Int) Int

cut :: String -> Int -> Int
cut number target = evalState (go number target) Map.empty
 where
  go :: String -> Int -> State Cache Int
  go number target = do
    let key = (number, target)

    let n = read number

    cached <- gets $ Map.lookup key

    case cached of
      Just ans -> return ans
      Nothing -> do
        ans <-
          if n <= target
            then return n
            else do
              xs <- mapM split [1 .. length number - 1]
              return $ maximum (-1 : xs)
        withState (Map.insert key ans) (pure ans)
   where
    split i = do
      l <- go (take i number) target
      r <- go (drop i number) (target - l)
      return $ if l >= 0 && r >= 0 then l + r else -1
