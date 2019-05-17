module Roman
  ( numerals
  )
where

import Data.List ( find )

symbols :: [(Integer, String)]
symbols =
  [ (1000, "M")
  , (900 , "CM")
  , (500 , "D")
  , (400 , "CD")
  , (100 , "C")
  , (90  , "XC")
  , (50  , "L")
  , (40  , "XL")
  , (10  , "X")
  , (9   , "IX")
  , (5   , "V")
  , (4   , "IV")
  , (1   , "I")
  ]

numerals :: Integer -> Maybe String
numerals 0 = Just ""
numerals n = (snd <$> pair) <> (((n -) . fst <$> pair) >>= numerals)
  where pair = find ((<= n) . fst) symbols
