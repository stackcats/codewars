{-# LANGUAGE OverloadedRecordDot #-}

module Ellipse (containsPoint) where

import Preloaded (Pt (..))

{-
-- from Preloaded

data Pt = Pt
  { ptX :: Double
  , ptY :: Double
  } deriving (Show)
-}

containsPoint :: Pt -> Pt -> Double -> Pt -> Bool
containsPoint f0 f1 l p = (distance f0 p) + (distance f1 p) <= l

distance p1 p2 = sqrt $ (p1.ptX - p2.ptX) ^ 2 + (p1.ptY - p2.ptY) ^ 2
