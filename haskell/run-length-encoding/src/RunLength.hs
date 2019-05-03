module RunLength (decode, encode) where

import Data.Char (isDigit)
import Data.List (group, groupBy)

decodeGroups :: [String] -> String
decodeGroups [] = ""
decodeGroups [x] = x
decodeGroups (x:y:zs)
    | isDigit $ head x = replicate (read x) (head y) ++ (decodeGroups zs)
    | otherwise = x ++ decodeGroups (y:zs)

decode :: String -> String
decode encodedText = decodeGroups $ groupBy bothIsDigit encodedText
    where bothIsDigit a b = isDigit a && isDigit b

encodeGroup :: String -> String
encodeGroup [x] = [x]
encodeGroup str = show (length str) ++ [head str]

encode :: String -> String
encode text = concat $ map encodeGroup $ group text
