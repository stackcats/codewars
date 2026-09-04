module WelcomeTranslation where

import Data.Maybe (fromMaybe)

-- You should put your database at top level near here
db =
  [ ("english", "Welcome")
  , ("czech", "Vitejte")
  , ("danish", "Velkomst")
  , ("dutch", "Welkom")
  , ("estonian", "Tere tulemast")
  , ("finnish", "Tervetuloa")
  , ("flemish", "Welgekomen")
  , ("french", "Bienvenue")
  , ("german", "Willkommen")
  , ("irish", "Failte")
  , ("italian", "Benvenuto")
  , ("latvian", "Gaidits")
  , ("lithuanian", "Laukiamas")
  , ("polish", "Witamy")
  , ("spanish", "Bienvenido")
  , ("swedish", "Valkommen")
  , ("welsh", "Croeso")
  ]

welcome :: String -> String
welcome lang = fromMaybe "Welcome" $ lookup lang db
