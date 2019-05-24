module Proverb
  ( recite
  )
where

recite :: [String] -> String
recite [] = ""
recite (x : xs) =
  unlines (zipWith line (x : xs) xs) ++ "And all for the want of a " ++ x ++ "."
 where
  line current next =
    "For want of a " ++ current ++ " the " ++ next ++ " was lost."
