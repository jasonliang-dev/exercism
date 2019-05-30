module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose)
import Data.List.Split (chunksOf)

normalize :: String -> String
normalize = map toLower . filter isAlphaNum

encode :: String -> String
encode xs = unwords $ transpose $ chunksOf cols normalized
 where
  normalized = normalize xs
  cols = (ceiling :: Double -> Int) $ sqrt $ fromIntegral $ length normalized
