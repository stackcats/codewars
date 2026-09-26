{-# LANGUAGE LambdaCase #-}

module Switcheroo where

switcheroo :: String -> String
switcheroo = map switch
 where
  switch = \case
    'a' -> 'b'
    'b' -> 'a'
    c -> c
