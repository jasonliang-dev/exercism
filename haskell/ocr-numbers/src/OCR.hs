module OCR (convert) where

import Data.List (lookup, intercalate)
import Data.List.Split (chunksOf)
import Data.Maybe (fromMaybe)

convertLine :: [String] -> String
convertLine xs
  | all null xs = []
  | otherwise   = fromMaybe '?' (lookup ch numbers) : convertLine rest
 where
  ch   = map (take 3) xs
  rest = map (drop 3) xs
  numbers =
    [ ([" _ ", "| |", "|_|", "   "], '0')
    , (["   ", "  |", "  |", "   "], '1')
    , ([" _ ", " _|", "|_ ", "   "], '2')
    , ([" _ ", " _|", " _|", "   "], '3')
    , (["   ", "|_|", "  |", "   "], '4')
    , ([" _ ", "|_ ", " _|", "   "], '5')
    , ([" _ ", "|_ ", "|_|", "   "], '6')
    , ([" _ ", "  |", "  |", "   "], '7')
    , ([" _ ", "|_|", "|_|", "   "], '8')
    , ([" _ ", "|_|", " _|", "   "], '9')
    ]

convert :: String -> String
convert = intercalate "," . map convertLine . chunksOf 4 . lines
