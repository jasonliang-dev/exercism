module Beer (song) where

import Data.Char (toUpper)
import Data.List (intercalate)

verse :: Int -> String
verse n = capitalize $ beerOnTheWall n ++ ", "
    ++ bottles n ++ " of beer.\n"
    ++ line3 n
    ++ beerOnTheWall ((n - 1) `mod` 100) ++ ".\n"
    where
        capitalize [] = []
        capitalize (x:xs) = toUpper x : xs
        bottles 0 = "no more bottles"
        bottles 1 = "1 bottle"
        bottles x = show x ++ " bottles"
        beerOnTheWall x = bottles x ++ " of beer on the wall"
        line3 0 = "Go to the store and buy some more, "
        line3 x = "Take " ++ it x ++ " down and pass it around, "
            where it 1 = "it"
                  it _ = "one"

song :: String
song = intercalate "\n" $ map verse [99,98..0]

