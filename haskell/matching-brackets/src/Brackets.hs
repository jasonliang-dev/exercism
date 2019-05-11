module Brackets (arePaired) where

import Data.Stack

match :: Stack Char -> String -> Bool
match st [] = stackIsEmpty st
match st (x : xs)
  | x `elem` "([{" = match (stackPush st x) xs
  | otherwise = case x of
    ')' -> popAndMatch '('
    ']' -> popAndMatch '['
    '}' -> popAndMatch '{'
    _   -> match st xs
 where
  matchWith ch st' curr = if curr == ch then match st' xs else False
  popAndMatch ch = maybe False (uncurry $ matchWith ch) (stackPop st)

arePaired :: String -> Bool
arePaired = match stackNew
