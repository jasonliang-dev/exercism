module Allergies (Allergen(..), allergies, isAllergicTo) where

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Show, Enum)

allergies :: Int -> [Allergen]
allergies = map fst . filter snd . zip [Eggs .. Cats] . toBinary

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = allergen `elem` allergies score

-- is reversed: toBinary 4 == [False, False, False, True]
toBinary :: Int -> [Bool]
toBinary 0 = [False]
toBinary n = toBinary' n
  where
    toBinary' 0 = []
    toBinary' n' = (n' `mod` 2 == 1) : toBinary' (n' `div` 2)
