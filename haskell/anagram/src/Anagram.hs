module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter notEq $ filter isAnagram $ xss
  where
    isAnagram candidate = sort (map toLower xs) == sort (map toLower candidate)
    notEq candidate = map toLower xs /= map toLower candidate
