module FromAtoZ (gimmeTheLetters) where

gimmeTheLetters :: String -> String
gimmeTheLetters (a : _ : b : _) = [a .. b]
