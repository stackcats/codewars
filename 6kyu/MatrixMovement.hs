module MatrixMovement (Move, move) where

import Preloaded (Command (..))

class Move a where
  move' :: State -> Command -> a

data State = State
  { rows :: Int
  , cols :: Int
  , pos :: (Int, Int)
  }

instance Move [[Int]] where
  move' (State n m p) STOP = buildMat n m p

instance (Move a) => Move (Command -> a) where
  move' state cmd = move' (step state cmd)

step :: State -> Command -> State
step state@(State n m (i, j)) cmd =
  case cmd of
    UP ->
      State n m ((i - 1 + n) `rem` n, j)
    DOWN ->
      State n m ((i + 1) `rem` n, j)
    LEFT ->
      State n m (i, (j - 1 + m) `rem` m)
    RIGHT ->
      State n m (i, (j + 1) `rem` m)
    STOP ->
      state

buildMat :: Int -> Int -> (Int, Int) -> [[Int]]
buildMat n m pos =
  [ [ if (r, c) == pos then 1 else 0
    | c <- [0 .. m - 1]
    ]
  | r <- [0 .. n - 1]
  ]

move :: (Move a) => [[Int]] -> Command -> a
move mat cmd =
  move' state cmd
 where
  n = length mat
  m = length (head mat)

  state = State n m (findPos mat)

findPos :: [[Int]] -> (Int, Int)
findPos mat =
  head
    [ (i, j)
    | (i, row) <- zip [0 ..] mat
    , (j, x) <- zip [0 ..] row
    , x == 1
    ]
