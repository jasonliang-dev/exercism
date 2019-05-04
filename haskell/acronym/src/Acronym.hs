module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper)

shorten :: String -> String
shorten [] = []
shorten word
    | all isUpper word = [head word]
    | '-' `elem` word = shorten left ++ shorten right
    | otherwise = toUpper (head word) : filter isUpper (tail word)
    where
        left = takeWhile (/='-') word
        right = tail $ dropWhile (/='-') word

abbreviate :: String -> String
abbreviate phrase = concat $ map shorten $ words phrase
