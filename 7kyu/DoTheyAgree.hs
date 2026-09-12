module DoTheyAgree (doTheyAgree) where

doTheyAgree :: [Int] -> [Int] -> Bool
doTheyAgree alice bob = a == b
 where
  a = filter (`elem` bob) alice
  b = filter (`elem` alice) bob
