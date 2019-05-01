module Isogram (isIsogram) where

import qualified Data.Set as Set
import Data.Char (isAlpha, toLower)

isIsogram :: String -> Bool
isIsogram str = length (Set.fromList xs) == length xs
    where xs = [toLower x | x <- str, isAlpha x]
