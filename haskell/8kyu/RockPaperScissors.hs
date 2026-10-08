module Codewars.RockPaperScissors where

rps :: String -> String -> String
rps p1 p2
  | rule p1 p2 = "Player 1 won!"
  | rule p2 p1 = "Player 2 won!"
  | otherwise = "Draw!"
 where
  rule "rock" "scissors" = True
  rule "scissors" "paper" = True
  rule "paper" "rock" = True
  rule _ _ = False
