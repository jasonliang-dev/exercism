module PrimeFactors (primeFactors) where

safeHead :: [a] -> Maybe a
safeHead []      = Nothing
safeHead (x : _) = Just x

primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors n = case divisor of
  Just x  -> x : primeFactors (n `div` x)
  Nothing -> [n]
  where divisor = safeHead [ x | x <- [2 .. n - 1], n `mod` x == 0 ]
