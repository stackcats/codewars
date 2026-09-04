module TheFeastOfManyBeasts where

feast :: String -> String -> Bool
feast beast dish = fl beast == fl dish
 where
  fl s = (head s, last s)
