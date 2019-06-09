module Queens (boardString, canAttack) where

import Data.Matrix (Matrix, getRow, nrows, matrix)
import Data.Vector (toList)
import Data.List (intersperse)
import Data.Maybe (fromMaybe)

toString :: Matrix Char -> String
toString xss =
  unlines $ map (intersperse ' ' . toList . (`getRow` xss)) [1 .. nrows xss]

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = toString $ matrix 8 8 boardCell
 where
  (wr, wc) = fromMaybe (-1, -1) white
  (br, bc) = fromMaybe (-1, -1) black
  boardCell (r, c) | r - 1 == wr && c - 1 == wc = 'W'
                   | r - 1 == br && c - 1 == bc = 'B'
                   | otherwise                  = '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (ar, ac) (br, bc) | ar == br || ac == bc           = True
                            | abs (ar - br) == abs (ac - bc) = True
                            | otherwise                      = False
