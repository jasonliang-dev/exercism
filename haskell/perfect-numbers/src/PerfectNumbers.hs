module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

-- Slow...
factors :: Int -> [Int]
factors n = [x | x <- [1.. n `div` 2], n `mod` x == 0]

classify :: Int -> Maybe Classification
classify n
    | n <= 0 = Nothing
    | aliquotSum n == n = Just Perfect
    | aliquotSum n > n = Just Abundant
    | aliquotSum n < n = Just Deficient
    | otherwise = Nothing
    where aliquotSum = sum . factors
