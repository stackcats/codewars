module SignLanguageGaslighting (gaslighting) where

import Data.List

gaslighting :: String -> String -> String -> Bool
gaslighting shirtWord yourWord friendsLetters =
  any (\(a, b) -> a `elem` friendsLetters || b `elem` friendsLetters) $ filter (uncurry (/=)) $ zip shirtWord yourWord
