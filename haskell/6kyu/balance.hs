module Kata (balance) where

import Data.Bool
import Data.Function

import Preloaded (Comparison (..))
import Prelude hiding (Either (..))

-- data Comparison = Left | Right | Balance deriving (Show, Eq, Enum, Bounded)

balance :: String -> String -> Comparison
balance l r = case (compare `on` weight) l r of
  LT -> Right
  GT -> Left
  _ -> Balance

weight = sum . map (bool 3 2 . (== '!'))
