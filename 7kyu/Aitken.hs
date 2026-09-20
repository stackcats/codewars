module Aitken (aitken) where

aitken :: Int -> Int -> Maybe Int
aitken r c = let xs = f r in xs !? c
 where
  f 0 = [1]
  f n = reverse $ foldl (\acc x -> (head acc + x) : acc) [h] xs
   where
    xs = f (n - 1)
    h = last xs

xs !? n
  | n < 0 = Nothing
  | otherwise =
      foldr
        ( \x r k -> case k of
            0 -> Just x
            _ -> r (k - 1)
        )
        (const Nothing)
        xs
        n
