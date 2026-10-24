module EvenBeforeFixed (evenNumbersBeforeFixed) where

evenNumbersBeforeFixed :: [Int] -> Int -> Maybe Int
evenNumbersBeforeFixed xs fixed
  | fixed `notElem` xs = Nothing
  | otherwise = Just $ length $ filter even $ takeWhile (/= fixed) xs
