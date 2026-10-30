module NoMusical (noMusical) where

import Data.List

noMusical :: Int -> Int -> Int -> Int -> Int
noMusical start end 0 _ = end - start + 1
noMusical start end musicalEvery durationEnrolment = end - start + 1 - length xs
 where
  xs = nub [j | i <- [start, start + musicalEvery .. end + durationEnrolment - 1], j <- [max start (i - durationEnrolment + 1) .. min end i]]
