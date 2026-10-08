module Health (updateHealth) where

updateHealth :: Double -> Double -> Double
updateHealth health damage = max 0 (health - damage)
