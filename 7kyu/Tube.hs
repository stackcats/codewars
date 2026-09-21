module Codewars.Kata.Tube where

import Codewars.Kata.Tube.Types

-- data Decision = Bus | Walk deriving (Eq, Show)

calculator ::
  -- | the distance you would have to walk
  Double ->
  -- | the distance the bus would travel
  Double ->
  -- | the distance you have to *walk* to the bus
  Double ->
  -- | your decision whether to take the Bus or Walk
  Decision
calculator distance busDrive busWalk
  | w > 2 = Bus
  | w < 0.16667 = Walk
  | busWalk / 5 + busDrive / 8 < w = Bus
  | otherwise = Walk
 where
  w = distance / 5
