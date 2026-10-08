module ZeroOrMoreHands (whichHand) where

import Preloaded (Hand (..)) -- data Hand = NONE | LEFT | RIGHT | BOTH deriving (Show,Eq)

lefts = "qwertasdfgzxcvb"
rights = "yuiophjklnm"

whichHand :: String -> Hand
whichHand [] = NONE
whichHand s
  | l && r = BOTH
  | l = LEFT
  | otherwise = RIGHT
 where
  t = take 100 s
  l = any (`elem` t) lefts
  r = any (`elem` t) rights
