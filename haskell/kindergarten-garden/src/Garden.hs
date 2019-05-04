module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import Data.Map (Map, fromList, findWithDefault)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

type Garden = Map String [Plant]

assign :: String -> String -> (String, [Plant])
assign student plants = (student, map toPlant $ plants)
    where toPlant ch = case ch of
            'C' -> Clover
            'G' -> Grass
            'R' -> Radishes
            'V' -> Violets
            _   -> error ""

garden' :: [String] -> String -> String -> [(String, [Plant])]
garden' [] _ _ = []
garden' (student:students) top bot = kv : rest
    where
        (topGroup, topRest) = splitAt 2 top
        (botGroup, botRest) = splitAt 2 bot
        kv = assign student (topGroup ++ botGroup)
        rest = garden' students topRest botRest

garden :: [String] -> String -> Garden
garden students plants = fromList $ garden' students topRow botRow
    where
        topRow = takeWhile (/='\n') plants
        botRow = tail $ dropWhile (/='\n') plants

lookupPlants :: String -> Garden -> [Plant]
lookupPlants = findWithDefault []
