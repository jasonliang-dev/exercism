module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number xs
    | length (snd num) /= 10 = Nothing
    | fst num /= '1' = Nothing
    | or $ map ($ snd num) [nvalid 0, nvalid 3] = Nothing
    | otherwise = Just $ snd num
    where
        nvalid n = not . (`elem` ['2'..'9']) . (!! n)
        stripped = filter isDigit xs
        num = if length stripped == 11
            then (head stripped, tail stripped)
            else ('1', stripped)
