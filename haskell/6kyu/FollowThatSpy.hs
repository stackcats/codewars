module FollowThatSpy (findRoutes) where

import Data.List
import Data.Maybe

findRoutes :: [(String, String)] -> String
findRoutes routes = go [start]
 where
  desc = map snd routes
  start = fst . fromJust $ find ((`notElem` desc) . fst) routes

  go paths@(x : _) = case lookup x routes of
    Nothing -> intercalate ", " $ reverse paths
    Just y -> go (y : paths)
