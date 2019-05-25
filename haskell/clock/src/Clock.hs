module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock Int Int deriving (Eq)

instance Num Clock where
  (Clock hour1 min1) + (Clock hour2 min2) = fromHourMin (hour1 + hour2) (min1 + min2)
  (-) = undefined
  (*) = undefined
  abs = id
  signum = const 1
  fromInteger = fromHourMin 0 . fromInteger

instance Show Clock where
  show (Clock hour minute) = printf "%02d:%02d" hour minute

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = Clock (hour' `mod` 24) (minute `mod` 60)
  where hour' = hour + minute `div` 60

toString :: Clock -> String
toString = show

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute clock = Clock hour minute + clock
