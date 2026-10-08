module TandemDuplication (binaryDuplication) where

binaryDuplication :: String -> Maybe [(Int, Int)]
binaryDuplication s =
  case foldl (\(st, len, ans) c -> f (c : st) (len + 1) ans) ([], 0, []) s of
    ("10", _, ans) -> Just ans
    _ -> Nothing

f (a : b : rst) n ans
  | a == b = f (a : rst) (n - 1) ((n - 2, n - 1) : ans)
f (a : b : c : d : rst) n ans
  | a == c, b == d, a /= b = f (a : b : rst) (n - 2) ((n - 4, n - 2) : ans)
f st n ans = (st, n, ans)
