module Codewars.Kata.Enigma where

import Control.Monad
import Data.List.Split
import Data.Map qualified as Map
import Data.Maybe

-- | Either creates a processing function, or tells us that the configuration is invalid.
plugboard :: String -> Either String (Char -> Char)
plugboard "" = Right id
plugboard xs
  | length xs > 20 = Left "error"
  | odd (length xs) = Left "error"
  | mp == mempty = Left "error"
  | otherwise = Right (\c -> fromMaybe c $ Map.lookup c mp)
 where
  mp = case foldM insertUnique mempty $ concatMap f $ chunksOf 2 xs of
    Just m -> m
    Nothing -> Map.empty

  f [a, b] = [(a, b), (b, a)]

  insertUnique m (k, v)
    | Map.member k m = Nothing
    | otherwise = Just (Map.insert k v m)
