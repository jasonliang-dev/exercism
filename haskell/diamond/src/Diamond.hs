module Diamond (diamond) where

nthLetter :: Char -> Int
nthLetter letter = fromEnum letter - 65

display :: Char -> Int -> Int -> Char
display letter mid col
    | col == left || col == right = letter
    | otherwise = ' '
    where
        shift = nthLetter letter
        left = mid - shift
        right = mid + shift

diamond :: Char -> Maybe [String]
diamond c
    | 'A' <= c && c <= 'Z' = Just $ topHalf ++ reverse (init topHalf)
    | otherwise = Nothing
    where
        len = nthLetter c * 2
        mid = len `div` 2
        makeRow letter = map (display letter mid) [0..len]
        topHalf = map makeRow ['A'..c]
