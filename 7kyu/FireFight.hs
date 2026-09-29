{-# LANGUAGE OverloadedStrings #-}

module FireFight (fire_fight) where

import Data.Text (Text, replace)

fire_fight :: Text -> Text
fire_fight = replace "Fire" "~~"
