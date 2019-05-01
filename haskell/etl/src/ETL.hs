module ETL (transform) where

import Data.Map (Map, foldrWithKey, fromList)
import Data.Char (toLower)

transform :: Map a String -> Map Char a
transform = fromList . concat . foldrWithKey transformOne []
    where transformOne k str acc = zip (map toLower str) (repeat k) : acc
