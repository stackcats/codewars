module Welcome where

sayhello :: [String] -> String -> String -> String
sayhello name city state =
  "Hello, " ++ unwords name ++ "! Welcome to " ++ city ++ ", " ++ state ++ "!"
