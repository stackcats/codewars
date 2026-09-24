module Codewars.Exercise.Building where

data Block = Block {w :: Integer, l :: Integer, h :: Integer}

-- The test will use `block` to create
-- the blocks.
block :: (Integer, Integer, Integer) -> Block
block (w, l, h) = Block{w, l, h}

getWidth :: Block -> Integer
getWidth (Block{w}) = w

getLength :: Block -> Integer
getLength (Block{l}) = l

getHeight :: Block -> Integer
getHeight (Block{h}) = h

getVolume :: Block -> Integer
getVolume (Block{w, l, h}) = w * l * h

getSurfaceArea :: Block -> Integer
getSurfaceArea (Block{w, l, h}) = (* 2) $ w * l + w * h + l * h
