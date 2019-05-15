module BinarySearch (find) where

import Data.Array (Array, (!), bounds)

find' :: Ord a => Array Int a -> (Int, Int) -> a -> Maybe Int
find' array (left, right) x | right < left = Nothing
                            | x < val      = find' array (left, mid - 1) x
                            | x > val      = find' array (mid + 1, right) x
                            | otherwise    = Just mid
 where
  mid = (left + right) `div` 2
  val = array ! mid

find :: Ord a => Array Int a -> a -> Maybe Int
find array = find' array (bounds array)
