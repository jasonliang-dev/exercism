module Matrix
  ( Matrix
  , cols
  , column
  , flatten
  , fromList
  , fromString
  , reshape
  , row
  , rows
  , shape
  , transpose
  )
where

import Data.Vector (Vector, (!))
import qualified Data.Vector as Vector
                              ( length
                              , head
                              , fromList
                              , map
                              , concatMap
                              , take
                              , drop
                              , generate
                              )

type Matrix a = Vector (Vector a)

cols :: Matrix a -> Int
cols matrix | Vector.length matrix == 0 = 0
            | otherwise                 = Vector.length $ Vector.head matrix

column :: Int -> Matrix a -> Vector a
column x = Vector.map (! x)

flatten :: Matrix a -> Vector a
flatten = Vector.concatMap id

fromList :: [[a]] -> Matrix a
fromList = Vector.fromList . map Vector.fromList

fromString :: Read a => String -> Matrix a
fromString = fromList . map (map read . words) . lines

chunksOf :: Int -> Vector a -> [Vector a]
chunksOf n vec | Vector.length vec == 0 = []
               | otherwise = Vector.take n vec : chunksOf n (Vector.drop n vec)

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (r, _) = Vector.fromList . chunksOf r . flatten

row :: Int -> Matrix a -> Vector a
row = flip (!)

rows :: Matrix a -> Int
rows = Vector.length

shape :: Matrix a -> (Int, Int)
shape matrix = (rows matrix, cols matrix)

transpose :: Matrix a -> Matrix a
transpose matrix = Vector.generate (cols matrix) (`column` matrix)
