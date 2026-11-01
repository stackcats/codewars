module MaybeConcat (concatMaybe) where

concatMaybe :: Maybe String -> Maybe String -> Maybe String
concatMaybe (Just a) (Just b) = Just (a <> " " <> b)
concatMaybe _ _ = Nothing
