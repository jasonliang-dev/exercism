module Triplet
  ( tripletsWithSum
  )
where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum s =
  [ (a, b, c)
  | a <- [1..s]
  , b <- [a..s]
  , let c = s - a - b
  , a * a + b * b == c * c
  ]

