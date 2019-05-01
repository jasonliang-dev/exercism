module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer
collatz' n
    | even n = n `div` 2
    | otherwise = n * 3 + 1

collatz :: Integer -> Maybe Integer
collatz n
    | n <= 0 = Nothing
    | otherwise = Just . fromIntegral . length . takeWhile (1 /=) . iterate collatz' $ n
