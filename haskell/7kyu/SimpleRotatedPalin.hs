module SimpleRotatedPalin where

solve :: String -> Bool
solve "" = True
solve xs = any ((==) <*> reverse) $ take (length xs) $ iterate ((:) <$> last <*> init) xs
