module Triangle (rows) where

row :: [Integer] -> [Integer]
row xs = 1 : snd (foldr buildRow (0, []) xs)
  where buildRow curr (prev, acc) = (curr, prev + curr : acc)

rows :: Int -> [[Integer]]
rows = reverse . go
 where
  go 0 = []
  go 1 = [[1]]
  go x = row (head rest) : rest where rest = go (x - 1)
