module BabyShark (babySharkLyrics) where

x = map (++ " shark") ["Baby", "Mommy", "Daddy", "Grandma", "Grandpa"] ++ ["Let's go hunt"]

d = ", doo doo doo doo doo doo"

babySharkLyrics :: String
babySharkLyrics = (unlines $ concatMap (\s -> replicate 3 (s ++ d) ++ [s ++ "!"]) x) ++ "Run away,…\n"
