module BatteryBars (batteryBars) where

batteryBars :: Int -> String
batteryBars n = "[" ++ replicate d '#' ++ replicate (5 - d) '.' ++ "]"
 where
  d = n `div` 20
