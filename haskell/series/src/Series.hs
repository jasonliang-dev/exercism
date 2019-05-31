module Series (slices) where

import Data.Char (digitToInt)

slices :: Int -> String -> [[Int]]
slices n = go
 where
  go xs | n == 0        = [] : map (const []) xs
        | length xs < n = []
        | otherwise     = map digitToInt (take n xs) : go (tail xs)
