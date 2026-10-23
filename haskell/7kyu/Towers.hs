module Towers where

towerCombination :: Integer -> Integer
towerCombination = product . enumFromTo 2
