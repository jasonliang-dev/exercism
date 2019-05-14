module Hamming (distance) where

import Data.Function (on)

distance :: String -> String -> Maybe Int
distance xs ys
    | ((/=) `on` length) xs ys = Nothing
    | otherwise = Just $ length $ filter not $ zipWith (==) xs ys
