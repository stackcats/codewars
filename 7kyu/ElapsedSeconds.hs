module ElapsedSeconds (elapsedSeconds) where

import Data.Time.Clock

elapsedSeconds :: UTCTime -> UTCTime -> Integer
elapsedSeconds = (floor .) . flip diffUTCTime
