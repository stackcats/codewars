module Codewars.G964.Dateamount where

import Data.Time
import Data.Time.Calendar
import Data.Time.Format

dateNbDays :: Double -> Double -> Double -> String
dateNbDays a0 a p = formatTime defaultTimeLocale "%Y-%m-%d" $ addDays days $ read "2016-01-01"
 where
  days = ceiling $ log (a / a0) / log (1 + p / 36000)
