module IsbnVerifier (isbn) where

import Data.Char (isDigit, digitToInt)
import Control.Applicative (liftA2)
import Data.Maybe (fromMaybe)

fromCheckDigit :: Char -> Maybe Int
fromCheckDigit ch
    | isDigit ch = Just $ digitToInt ch
    | ch == 'X' = Just 10
    | otherwise = Nothing

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just $ init xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast xs = Just $ last xs

isbn :: String -> Bool
isbn [] = False
isbn xs
    | length cleaned /= 10 = False
    | otherwise = sum (zipWith (*) [10, 9..1] cleaned) `mod` 11 == 0
    where
        initial = map digitToInt . filter isDigit <$> safeInit xs
        checkDigit = safeLast xs >>= fromCheckDigit
        cleaned = fromMaybe [] $ liftA2 (++) initial $ return <$> checkDigit
