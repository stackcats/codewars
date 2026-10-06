module Reject (reject) where

reject :: (a -> Bool) -> [a] -> [a]
reject f = filter (not . f)
