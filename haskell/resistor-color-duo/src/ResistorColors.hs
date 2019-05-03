module ResistorColors (Color(..), value) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Enum, Show, Read)

value :: [Color] -> Int
value = foldl (\acc x -> acc * 10 + fromEnum x) 0
