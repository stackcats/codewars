module Medal where

evilCodeMedal :: String -> String -> String -> String -> Maybe String
evilCodeMedal u g s b
  | u < g = Just "Gold"
  | u < s = Just "Silver"
  | u < b = Just "Bronze"
  | otherwise = Nothing
