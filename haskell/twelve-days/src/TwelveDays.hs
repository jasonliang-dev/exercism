module TwelveDays (recite) where

toWord :: Int -> String
toWord n = case n of
    1  -> "first"
    2  -> "second"
    3  -> "third"
    4  -> "fourth"
    5  -> "fifth"
    6  -> "sixth"
    7  -> "seventh"
    8  -> "eighth"
    9  -> "ninth"
    10 -> "tenth"
    11 -> "eleventh"
    12 -> "twelfth"
    _  -> error "toWord out of range"

gift :: Int -> String
gift n = case n of
    1  -> "a Partridge in a Pear Tree"
    2  -> "two Turtle Doves"
    3  -> "three French Hens"
    4  -> "four Calling Birds"
    5  -> "five Gold Rings"
    6  -> "six Geese-a-Laying"
    7  -> "seven Swans-a-Swimming"
    8  -> "eight Maids-a-Milking"
    9  -> "nine Ladies Dancing"
    10 -> "ten Lords-a-Leaping"
    11 -> "eleven Pipers Piping"
    12 -> "twelve Drummers Drumming"
    _  -> error "gift out of range"

reciteVerse :: Int -> String
reciteVerse 1 = "On the first day of Christmas my true love gave to me: " ++ gift 1 ++ "."
reciteVerse n = "On the " ++ toWord n ++ " day of Christmas my true love gave to me: "
    ++ concat (map ((++ ", ") . gift) [n, (n - 1)..2]) ++ "and " ++ gift 1 ++ "."

recite :: Int -> Int -> [String]
recite start stop = map reciteVerse [start..stop]
