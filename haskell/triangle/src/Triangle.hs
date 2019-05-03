module Triangle (TriangleType(..), triangleType) where

import Data.List (nub)

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

cycleWrap :: [a] -> [[a]]
cycleWrap [] = cycleWrap []
cycleWrap (x:xs) = (x:xs) : cycleWrap (xs ++ [x])

triangleType :: (Ord a, Num a) => a -> a -> a -> TriangleType
triangleType a b c
    | any illegal $ take 3 $ cycleWrap [a,b,c] = Illegal
    | a == b && b == c = Equilateral
    | nub [a,b,c] == [a,b,c] = Scalene
    | otherwise = Isosceles
    where
        illegal [x,y,z] = x + y <= z
        illegal _ = False
