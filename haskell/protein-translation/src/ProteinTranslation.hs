module ProteinTranslation
  ( proteins
  )
where

import           Data.List.Split                ( chunksOf )

toProtein :: String -> Maybe String
toProtein condon | condon == "AUG"                     = Just "Methionine"
                 | condon `elem` ["UUU", "UUC"]        = Just "Phenylalanine"
                 | condon `elem` ["UUA", "UUG"]        = Just "Leucine"
                 | condon `elem` ["UCU", "UCC", "UCA", "UCG"] = Just "Serine"
                 | condon `elem` ["UAU", "UAC"]        = Just "Tyrosine"
                 | condon `elem` ["UGU", "UGC"]        = Just "Cysteine"
                 | condon == "UGG"                     = Just "Tryptophan"
                 | condon `elem` ["UAA", "UAG", "UGA"] = Just "STOP"
                 | otherwise                           = Nothing

proteins :: String -> Maybe [String]
proteins rna = takeWhile (/= "STOP") <$> (traverse toProtein $ chunksOf 3 rna)
