module Postfix where

begin = ($ [])
push xs x f = f (x:xs)
add (x:y:xs) f = f (x+y : xs)
end = head
