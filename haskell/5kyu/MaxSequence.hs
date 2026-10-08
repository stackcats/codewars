module MaxSequence where

-- Return the greatest subarray sum within the array of integers passed in.
maxSequence :: [Int] -> Int
maxSequence [] = 0
maxSequence xs = max 0 $ snd $ foldl f (0, minBound :: Int) xs
 where
  f (cur, ans) n =
    let nxt = max n (cur + n)
     in (nxt, max nxt ans)
