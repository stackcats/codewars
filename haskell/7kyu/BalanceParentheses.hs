module BalanceParentheses (fixParens) where

fixParens :: String -> String
fixParens s = replicate b '(' ++ s ++ replicate a ')'
 where
  a = foldl (\ct c -> if c == '(' then ct + 1 else max 0 (ct - 1)) 0 s
  b = foldr (\c ct -> if c == ')' then ct + 1 else max 0 (ct - 1)) 0 s
