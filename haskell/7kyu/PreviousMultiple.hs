module PreviousMultiple (prevMultOfThree) where

prevMultOfThree :: Int -> Maybe Int
prevMultOfThree 0 = Nothing
prevMultOfThree n
  | n `mod` 3 == 0 = Just n
  | otherwise = prevMultOfThree (n `div` 10)
