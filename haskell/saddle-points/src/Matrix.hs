module Matrix (saddlePoints) where

import Data.Array (Array, bounds, (!), range)

type Point = (Int, Int)

isSaddlePoint :: Ord e => Array Point e -> Point -> Point -> Bool
isSaddlePoint matrix (rows, cols) point = rowTest && colTest
  where
    rowTest = all (\r -> (matrix ! (r, snd point)) >= valAtPoint) [0..rows]
    colTest = all (\c -> (matrix ! (fst point, c)) <= valAtPoint) [0..cols]
    valAtPoint = matrix ! point

saddlePoints :: Ord e => Array Point e -> [Point]
saddlePoints matrix = filter (isSaddlePoint matrix size) (range $ bounds matrix)
  where (_, size) = bounds matrix
