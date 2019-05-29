module OCR (convert) where

import Data.List (lookup, intercalate, transpose)
import Data.List.Split (chunksOf)
import Data.Maybe (fromMaybe)

convertLine :: [String] -> String
convertLine xs | all null xs = []
               | otherwise = fromMaybe '?' (lookup ch table) : convertLine rest
 where
  ch      = map (take 3) xs
  rest    = map (drop 3) xs
  numbers = transpose $ map
    (chunksOf 3)
    [ " _     _  _     _  _  _  _  _ "
    , "| |  | _| _||_||_ |_   ||_||_|"
    , "|_|  ||_  _|  | _||_|  ||_| _|"
    , "                              "
    ]
  table = zip numbers ['0' .. '9']

convert :: String -> String
convert = intercalate "," . map convertLine . chunksOf 4 . lines
