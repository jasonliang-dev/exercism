module Base (Error(..), rebase) where

import Control.Monad (zipWithM)

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

fromBase :: Integral a => a -> [a] -> Either (Error a) a
fromBase base digits | base <= 1 = Left InvalidInputBase
                     | otherwise = sum <$> zipWithM zipper digits colval
 where
  colval = [length digits - 1, length digits - 2 ..]
  zipper a b =
    if 0 <= a && a < base then Right $ a * base ^ b else Left (InvalidDigit a)

toBase :: Integral a => a -> a -> Either (Error a) [a]
toBase base n | base <= 1 = Left InvalidOutputBase
              | otherwise = Right $ reverse (go n)
 where
  go 0  = []
  go xs = xs `mod` base : go (xs `div` base)

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase inputBase outputBase inputDigits =
  fromBase inputBase inputDigits >>= toBase outputBase
