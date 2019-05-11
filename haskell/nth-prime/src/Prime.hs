module Prime (nth) where

primes :: [Integer]
primes = filterPrime [2..]
  where filterPrime (p:xs) =
          p : filterPrime [x | x <- xs, x `mod` p /= 0]

nth :: Int -> Maybe Integer
nth n
  | n <= 0 = Nothing
  | otherwise = Just $ primes !! (n - 1)
