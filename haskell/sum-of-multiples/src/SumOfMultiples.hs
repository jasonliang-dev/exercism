module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter modEach [1..limit - 1]
    where modEach x = any ((0 ==) . (x `mod`)) $ filter (0 /=) factors
