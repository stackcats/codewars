module IPv4Class where

import Data.List.Split
import Text.Printf

ipv4AddressClass :: String -> Char
ipv4AddressClass addr =
  case printf "%08b" x of
    '0' : _ -> 'A'
    '1' : '0' : _ -> 'B'
    '1' : '1' : '0' : _ -> 'C'
    '1' : '1' : '1' : '0' : _ -> 'D'
    _ -> 'E'
 where
  x :: Int
  x = read . head $ splitOn "." addr
