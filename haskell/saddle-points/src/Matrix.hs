module Matrix (saddlePoints) where

import Data.Array (Array, Ix, bounds, (!), range)

isSaddlePoint :: (Ix r, Ix c, Num r, Num c, Enum r, Enum c, Ord e) => Array (r, c) e -> (r, c) -> (r, c) -> Bool
isSaddlePoint matrix (rows, cols) point = rowTest && colTest
  where
    rowTest = all (\r -> (matrix ! (r, snd point)) >= valAtPoint) [0..rows]
    colTest = all (\c -> (matrix ! (fst point, c)) <= valAtPoint) [0..cols]
    valAtPoint = matrix ! point

saddlePoints :: (Ix r, Ix c, Num r, Num c, Enum r, Enum c, Ord e) => Array (r, c) e -> [(r, c)]
saddlePoints matrix = filter (isSaddlePoint matrix size) (range $ bounds matrix)
  where (_, size) = bounds matrix
