module SequenceSum (sequenceSum) where

sequenceSum :: (Integer, Integer, Integer) -> Integer
sequenceSum (begin, end, step) = sum [begin, begin + step .. end]
