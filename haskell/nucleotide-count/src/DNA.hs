module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

toNucleotide :: Char -> Either String Nucleotide
toNucleotide c = case c of
    'A' -> Right A
    'C' -> Right C
    'G' -> Right G
    'T' -> Right T
    _ -> Left "Invalid strand"

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldr (adjust succ) initialMap <$> traverse toNucleotide xs
    where initialMap = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
