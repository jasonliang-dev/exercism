module Raindrops (convert) where

import Data.Foldable (fold)
import Data.List (intersect)

factors :: Int -> [Int]
factors n = filter ((0 ==) . mod n) [1 .. n `div` 2] ++ [n]

speak :: Int -> String
speak n = case n of
    3 -> "Pling"
    5 -> "Plang"
    7 -> "Plong"
    _ -> ""

foldMapOrDefault :: Monoid m => m -> (a -> m) -> [a] -> m
foldMapOrDefault d fn xs = if null ys then d else fold ys
    where ys = map fn xs

convert :: Int -> String
convert n = foldMapOrDefault (show n) speak xs
    where xs = [3, 5, 7] `intersect` factors n
