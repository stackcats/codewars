module UFC where

import Data.Char

fighter :: String -> String
fighter name =
  if map toLower name == "conor mcgregor"
    then "I'd like to take this chance to apologize.. To absolutely NOBODY!"
    else "I am not impressed by your performance."
