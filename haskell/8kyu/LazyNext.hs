module LazyNext where

next :: (Eq a) => a -> [a] -> Maybe a
next x xs =
  case dropWhile (/= x) xs of
    (_ : y : _) -> Just y
    _ -> Nothing
