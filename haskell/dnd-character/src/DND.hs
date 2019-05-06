module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen, choose)
import Control.Monad (replicateM)

data Character = Character
  { name         :: String
  , strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier n = (n - 10) `div` 2

ability :: Gen Int
ability = (\xs -> sum xs - minimum xs) <$> (replicateM 4 $ choose (1, 6))

character :: Gen Character
character = do
  str <- ability
  dex <- ability
  con <- ability
  int <- ability
  wis <- ability
  cha <- ability
  return Character
    { name = "Cake"
    , strength = str
    , dexterity = dex
    , constitution = con
    , intelligence = int
    , wisdom = wis
    , charisma = cha
    , hitpoints = 10 + modifier con
    }
