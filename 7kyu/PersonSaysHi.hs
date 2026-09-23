module PersonSaysHi where

import Text.Printf

data Person = Person {firstName :: String, lastName :: String}

sayHi :: Person -> String
sayHi (Person f l) = printf "Hi, i'am %s %s and it is nice to meet You." f l
