module Arach where

drawSpider :: Int -> Int -> Char -> Char -> String
drawSpider l b m e = concat $ left ++ [[m]] ++ right
 where
  x = 2 ^ (pred b)
  leftLeg = case l of
    1 -> "^"
    2 -> "/\\"
    3 -> "/╲"
    4 -> "╱╲"
  rightLeg = case l of
    1 -> "^"
    2 -> "/\\"
    3 -> "╱\\"
    4 -> "╱╲"
  leftBody = replicate b '('
  rightBody = replicate b ')'
  leftEye = replicate x e
  left = [leftLeg, leftBody, leftEye]
  right = [reverse leftEye, rightBody, rightLeg]
