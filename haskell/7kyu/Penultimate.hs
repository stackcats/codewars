module Penultimate where

penultimate :: [a] -> a
penultimate = last . init
