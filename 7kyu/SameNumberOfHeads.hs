module SameNumberOfHeads (splitCoins) where

import Preloaded as Coin (Coin, flip)

splitCoins :: [Coin] -> Int -> ([Coin], [Coin])
splitCoins coins k = (map Coin.flip $ take k coins, drop k coins)
