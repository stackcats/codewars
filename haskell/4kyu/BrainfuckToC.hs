module BrainfuckToC (brainfuckToC) where

import Text.Printf

brainfuckToC :: String -> String
brainfuckToC str
  | check s = toC $ reduce [] s
  | otherwise = "Error!"
 where
  s = filter (`elem` "+-<>.[],") str

check :: String -> Bool
check s = f [] $ filter (`elem` "[]") s
 where
  f [] [] = True
  f _ [] = False
  f [] (']' : _) = False
  f xs ('[' : ys) = f ('[' : xs) ys
  f ('[' : xs) (']' : ys) = f xs ys
  f _ _ = False

reduce st [] = reverse st
reduce [] (op : codes) = reduce [op] codes
reduce (t : st) (op : codes) =
  case (t, op) of
    ('+', '-') -> reduce st codes
    ('-', '+') -> reduce st codes
    ('>', '<') -> reduce st codes
    ('<', '>') -> reduce st codes
    ('[', ']') -> reduce st codes
    _ -> reduce (op : t : st) codes

toC :: String -> String
toC s = fst $ foldl f ("", 0) $ group s
 where
  f (acc, n) s = (acc ++ spaces ++ (commandToC s), n1)
   where
    (spaces, n1) = case head s of
      '[' -> (take n $ repeat ' ', n + 2)
      ']' -> (take (n - 2) $ repeat ' ', n - 2)
      _ -> (take n $ repeat ' ', n)

commandToC :: String -> String
commandToC s =
  case head s of
    '+' -> printf "*p += %d;\n" n
    '-' -> printf "*p -= %d;\n" n
    '>' -> printf "p += %d;\n" n
    '<' -> printf "p -= %d;\n" n
    '.' -> "putchar(*p);\n"
    ',' -> "*p = getchar();\n"
    '[' -> "if (*p) do {\n"
    ']' -> "} while (*p);\n"
 where
  n = length s

group :: String -> [String]
group s = g [] s
 where
  g res [] = reverse res
  g [] (s : ss) = g [[s]] ss
  g res@(prev : xs) (s : ss)
    | s `elem` "+-<>" && head prev == s = g ((s : prev) : xs) ss
    | otherwise = g ([s] : res) ss
