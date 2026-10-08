import Data.Function
import Data.List

vertical :: [String] -> String
vertical xs =
  map (padRight maxLength) xs
    & transpose
    & map (unwords . map (: []) . dropWhileEnd isSpace)
    & intercalate "\n"
 where
  maxLength = maximum $ map length xs

padRight :: Int -> String -> String
padRight n s = s ++ replicate (n - length s) ' '
