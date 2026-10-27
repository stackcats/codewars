module BirthdayII where

import Data.Char
import Data.List

data Present = Goodpresent | Crap | Empty | Bang | Badpresent | Dog deriving (Eq, Show, Enum)
type Message = String
type NumPasses = Int

present :: Present -> NumPasses -> Message
present p n =
  case p of
    Goodpresent -> map (chr . (+ n) . ord) s
    Badpresent -> "Take this back!"
    Crap -> sort s
    Empty -> sort s
    Bang -> show $ sum $ map ((subtract n) . ord) s
    Dog -> "pass out from excitement " ++ show n ++ " times"
 where
  s = map toLower $ show p
