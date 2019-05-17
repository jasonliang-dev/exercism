module Roman
  ( numerals
  )
where

numerals :: Integer -> Maybe String
numerals 1    = Just "I"
numerals 4    = Just "IV"
numerals 5    = Just "V"
numerals 9    = Just "IX"
numerals 10   = Just "X"
numerals 40   = Just "XL"
numerals 50   = Just "L"
numerals 90   = Just "XC"
numerals 100  = Just "C"
numerals 400  = Just "CD"
numerals 500  = Just "D"
numerals 900  = Just "CM"
numerals 1000 = Just "M"
numerals n | n > 3000 = Nothing
           | n > 1000 = (replicate (fromIntegral n `div` 1000) 'M' ++) <$> numerals (n `mod` 1000) 
           | n > 900 = ("CM" ++) <$> numerals (n `mod` 900) 
           | n > 500 = ("D" ++) <$> numerals (n `mod` 500) 
           | n > 400 = ("CD" ++) <$> numerals (n `mod` 400) 
           | n > 100 = (replicate (fromIntegral n `div` 100) 'C' ++) <$> numerals (n `mod` 100) 
           | n > 90 = ("XC" ++) <$> numerals (n `mod` 90) 
           | n > 50 = ("L" ++) <$> numerals (n `mod` 50) 
           | n > 40 = ("XL" ++) <$> numerals (n `mod` 40) 
           | n > 10 = (replicate (fromIntegral n `div` 10) 'X' ++) <$> numerals (n `mod` 10)
           | n > 5 = ("V" ++) <$> numerals (n `mod` 5)
           | otherwise = Just $ replicate (fromIntegral n) 'I'
