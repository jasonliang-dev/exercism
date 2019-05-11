module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import Data.List (group, sort)
import Text.Regex (subRegex, mkRegex)

cleanQuotes :: String -> String
cleanQuotes xs = subRegex (mkRegex "'(\\w+)'") xs "\\1"

clean :: String -> String
clean [] = []
clean (x : xs) | isAlphaNum x = x : clean xs
               | x == '\''    = x : clean xs
               | otherwise    = ' ' : clean xs

wordCount :: String -> [(String, Int)]
wordCount = map decorate . group . sort . map normalize . words . clean
  where
    normalize = map toLower . cleanQuotes
    decorate ws = (head ws, length ws)
