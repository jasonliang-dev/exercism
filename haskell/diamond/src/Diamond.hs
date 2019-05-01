module Diamond (diamond) where

nthLetter :: Char -> Int
nthLetter letter = fromEnum letter - 65

plusMinus :: Int -> Int -> (Int, Int)
plusMinus a b = (a + b, a - b)

diamond :: Char -> Maybe [String]
diamond c
    | 'A' <= c && c <= 'Z' = Just $ topHalf ++ reverse (init topHalf)
    | otherwise = Nothing
    where
        len = nthLetter c * 2 + 1
        pos = plusMinus (len `div` 2)
        display col letter
            | col == left || col == right = letter
            | otherwise = ' '
            where (left, right) = pos (nthLetter letter)
        topHalf = [ [display col row | col <- [0..len - 1]] | row <- ['A'..c] ]
