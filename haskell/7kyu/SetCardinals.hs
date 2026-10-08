{-# LANGUAGE OverloadedStrings #-}

module SetCardinals (zfcDefinition) where

import Data.Text (Text)
import Data.Text qualified as T

zfcDefinition :: Int -> Text
zfcDefinition n = zfc n []

zfc 0 lst = "{" <> T.intercalate "," lst <> "}"
zfc n lst = zfc (n - 1) (lst ++ ["{" <> T.intercalate "," lst <> "}"])
