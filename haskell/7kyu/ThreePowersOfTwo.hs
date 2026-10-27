module ThreePowersOfTwo (threePowers) where

import Data.Bits

threePowers :: Integer -> Bool
threePowers = (&&) <$> (<= 3) . popCount <*> (>= 3)
