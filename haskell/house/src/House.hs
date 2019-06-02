module House (rhyme) where

import Text.Printf (printf)

headVerse :: String -> String
headVerse = printf "This is the %s"

lineVerse :: String -> String -> String
lineVerse = printf "that %s the %s"

verse :: [String] -> [String] -> [String]
verse _  []       = []
verse cs (t : ts) = headVerse t : zipWith lineVerse cs ts

rhyme :: String
rhyme = go contexts things
 where
  go [] [t] = printf "%s\n" $ headVerse t
  go cs ts  = printf "%s\n%s" (go (tail cs) (tail ts)) (unlines $ verse cs ts)
  contexts =
    [ "belonged to"
    , "kept"
    , "woke"
    , "married"
    , "kissed"
    , "milked"
    , "tossed"
    , "worried"
    , "killed"
    , "ate"
    , "lay in"
    ]
  things =
    [ "horse and the hound and the horn"
    , "farmer sowing his corn"
    , "rooster that crowed in the morn"
    , "priest all shaven and shorn"
    , "man all tattered and torn"
    , "maiden all forlorn"
    , "cow with the crumpled horn"
    , "dog"
    , "cat"
    , "rat"
    , "malt"
    , "house that Jack built."
    ]
