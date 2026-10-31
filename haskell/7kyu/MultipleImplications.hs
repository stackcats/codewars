module MultipleImplications (multImplication) where

multImplication :: [Bool] -> Maybe Bool
multImplication [] = Nothing
multImplication xs = Just $ foldl1 (\p q -> if p && not q then False else True) xs
