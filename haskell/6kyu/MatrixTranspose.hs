module MatrixTranspose where

transpose :: [[a]] -> [[a]]
transpose [] = []
transpose ([] : _) = []
transpose xxs = (:) <$> map head <*> transpose . map (drop 1) $ xxs
