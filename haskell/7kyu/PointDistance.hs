{-# LANGUAGE OverloadedRecordDot #-}

module PointDistance where

import Point

distanceBetweenPoints :: Point -> Point -> Float
distanceBetweenPoints a b = sqrt $ dx ^ 2 + dy ^ 2 + dz ^ 2
 where
  dx = a.x - b.x
  dy = a.y - b.y
  dz = a.z - b.z
