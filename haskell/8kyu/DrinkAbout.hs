module DrinkAbout (peopleWithAgeDrink) where

peopleWithAgeDrink :: Int -> String
peopleWithAgeDrink = ("drink " ++) . drink
 where
  drink age
    | age < 14 = "toddy"
    | age < 18 = "coke"
    | age < 21 = "beer"
    | otherwise = "whisky"
