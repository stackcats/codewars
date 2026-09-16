module ValidParentheses (validParentheses) where

validParentheses :: String -> Bool
validParentheses = f ""
 where
  f "" "" = True
  f _ "" = False
  f ('(' : xs) (')' : ys) = f xs ys
  f xs (y : ys) = f (y : xs) ys
