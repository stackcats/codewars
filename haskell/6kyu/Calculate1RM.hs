module Calculate1RM where

type Weight = Int
type Reps = Int

calculate1RM :: Weight -> Reps -> Weight
calculate1RM w 0 = 0
calculate1RM w 1 = w
calculate1RM w r = maximum $ map (\f -> f w' r') [epley, mcglothin, lombardi]
 where
  w' = fromIntegral w
  r' = fromIntegral r

epley :: Double -> Double -> Weight
epley w r = round $ w * (1 + r / 30)

mcglothin :: Double -> Double -> Weight
mcglothin w r = round $ 100 * w / (101.3 - 2.67123 * r)

lombardi :: Double -> Double -> Weight
lombardi w r = round $ w * (r ** 0.1)
