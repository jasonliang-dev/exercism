module SecretHandshake
  ( handshake
  )
where

-- binary is reversed
-- toBin 4 == [False, False, True, False]
toBin :: Int -> [Bool]
toBin 0 = [False]
toBin n = (n `mod` 2 == 1) : toBin (n `div` 2)

toActions :: [Bool] -> [String]
toActions = map fst . filter snd . zip actions
  where actions = ["wink", "double blink", "close your eyes", "jump"]

handshake :: Int -> [String]
handshake n | n >= 16   = reverse $ toActions binary
            | otherwise = toActions binary
  where binary = toBin n
