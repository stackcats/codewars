module RockPaperScissorsLizardSpock (rpsls) where

import Preloaded (RPSLS (..)) -- data RPSLS = Rock | Paper | Scissors | Lizard | Spock deriving (Show,Eq)

xs =
  [ (Scissors, Paper)
  , (Paper, Rock)
  , (Rock, Lizard)
  , (Lizard, Spock)
  , (Spock, Scissors)
  , (Scissors, Lizard)
  , (Lizard, Paper)
  , (Paper, Spock)
  , (Spock, Rock)
  , (Rock, Scissors)
  ]

rpsls :: RPSLS -> RPSLS -> Ordering
rpsls a b
  | (a, b) `elem` xs = GT
  | (b, a) `elem` xs = LT
  | otherwise = EQ
