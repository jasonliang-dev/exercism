module Proverb
  ( recite
  )
where

line :: String -> String -> String
line current next =
  "For want of a " ++ current ++ " the " ++ next ++ " was lost."

recite :: [String] -> String
recite [] = ""
recite (x : xs) =
  unlines (zipWith line (x : xs) xs) ++ "And all for the want of a " ++ x ++ "."
