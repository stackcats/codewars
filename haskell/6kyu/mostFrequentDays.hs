module Kata where

import Data.List
import Data.Maybe
import Data.Time

mostFrequentDays :: Integer -> [String]
mostFrequentDays year = map fst $ filter ((== ma) . snd) xs
 where
  t = fromJust $ fromGregorianValid year 1 1
  xs = map (\g -> (show $ head g, length g)) . group . sort $ map dayOfWeek $ takeWhile ((== year) . getYear) $ iterate (addDays 1) t
  ma = maximum $ map snd xs

getYear :: Day -> Integer
getYear t = y
 where
  (y, _, _) = toGregorian t
