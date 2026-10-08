module UnsquareEveryDigit (unsquareDigits) where

import Data.Function

unsquareDigits :: Integer -> Maybe Integer
unsquareDigits n =
  show n
    & unsquare
    & fmap (map read)
    & fmap minimum

unsquare :: String -> Maybe [String]
unsquare [] = Just [[]]
unsquare ('8' : '1' : xs) = fmap (map ('9' :)) $ unsquare xs
unsquare ('6' : '4' : xs) = fmap (map ('8' :)) $ unsquare xs
unsquare ('4' : '9' : xs) =
  let a = fmap (map ('7' :)) $ unsquare xs
      b = fmap (map ('2' :)) $ unsquare ('9' : xs)
   in a <> b
unsquare ('3' : '6' : xs) = fmap (map ('6' :)) $ unsquare xs
unsquare ('2' : '5' : xs) = fmap (map ('5' :)) $ unsquare xs
unsquare ('1' : '6' : xs) =
  let a = fmap (map ('4' :)) $ unsquare xs
      b = fmap (map ('1' :)) $ unsquare ('6' : xs)
   in a <> b
unsquare ('9' : xs) = fmap (map ('3' :)) $ unsquare xs
unsquare ('4' : xs) = fmap (map ('2' :)) $ unsquare xs
unsquare ('1' : xs) = fmap (map ('1' :)) $ unsquare xs
unsquare ('0' : xs) = fmap (map ('0' :)) $ unsquare xs
unsquare _ = Nothing
