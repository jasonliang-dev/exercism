module Say (inEnglish) where

chunk :: Integer -> [Integer]
chunk 0 = []
chunk n = (n `mod` 1000) : chunk (n `div` 1000)

sayChunk :: Integer -> String
sayChunk 0  = ""
sayChunk 1  = "one"
sayChunk 2  = "two"
sayChunk 3  = "three"
sayChunk 4  = "four"
sayChunk 5  = "five"
sayChunk 6  = "six"
sayChunk 7  = "seven"
sayChunk 8  = "eight"
sayChunk 9  = "nine"
sayChunk 10 = "ten"
sayChunk 11 = "eleven"
sayChunk 12 = "twelve"
sayChunk 13 = "thirteen"
sayChunk 14 = "fourteen"
sayChunk 15 = "fifteen"
sayChunk 16 = "sixteen"
sayChunk 17 = "seventeen"
sayChunk 18 = "eighteen"
sayChunk 19 = "nineteen"
sayChunk 20 = "twenty"
sayChunk 30 = "thirty"
sayChunk 40 = "forty"
sayChunk 50 = "fifty"
sayChunk 60 = "sixty"
sayChunk 70 = "seventy"
sayChunk 80 = "eighty"
sayChunk 90 = "ninety"
sayChunk n
  | n `mod` 100 == 0 = sayChunk (n `div` 100) ++ " hundred"
  | n >= 100 = sayChunk (n `div` 100) ++ " hundred " ++ sayChunk (n `mod` 100)
  | otherwise = sayChunk (n `div` 10 * 10) ++ "-" ++ sayChunk (n `mod` 10)

addSufix :: String -> String -> String
addSufix suffix x = if x == "" then "" else x ++ suffix

inEnglish :: Integer -> Maybe String
inEnglish 0 = Just "zero"
inEnglish n
  | n < 0
  = Nothing
  | otherwise
  = Just
    $ unwords
    $ reverse
    $ filter (not . null)
    $ zipWith addSufix suffixes
    $ map sayChunk
    $ chunk n
 where
  suffixes =
    ["", " thousand", " million", " billion", " trillion", " quadrillion"]
