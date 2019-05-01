module School (School, add, empty, grade, sorted) where

import Data.Map (fromListWith, toList)

type School = [(Int, String)]

add :: Int -> String -> School -> School
add gradeNum student [] = [(gradeNum, student)]
add gradeNum student (x:xs)
    | stu <= x = stu:x:xs
    | otherwise = x : add gradeNum student xs
    where stu = (gradeNum, student)

empty :: School
empty = []

grade :: Int -> School -> [String]
grade gradeNum school = [n | (g, n) <- school, g == gradeNum]

sorted :: School -> [(Int, [String])]
sorted = toList . fromListWith (++) . map (\(g, n) -> (g, [n])) . reverse
