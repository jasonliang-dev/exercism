module ArmstrongNumbers (armstrong) where

armstrong :: (Integral a, Show a, Read a) => a -> Bool
armstrong n = (n ==) $ sum $ map ((^length xs) . readChar) $ xs
    where
        xs = show n
        readChar c = read ([c])

