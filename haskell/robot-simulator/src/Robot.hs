module Robot
  ( Bearing(East, North, South, West)
  , bearing
  , coordinates
  , mkRobot
  , move
  )
where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum)

data Robot = Robot
  { bearing :: Bearing
  , coordinates :: (Integer, Integer)
  }

turnRight :: Bearing -> Bearing
turnRight West = North
turnRight dir  = succ dir

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft dir   = pred dir

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coords = Robot direction coords

step :: Robot -> Robot
step (Robot dir (x, y)) = case dir of
  North -> newPos (x, y + 1)
  East  -> newPos (x + 1, y)
  South -> newPos (x, y - 1)
  West  -> newPos (x - 1, y)
  where newPos = mkRobot dir

move :: Robot -> String -> Robot
move robot "" = robot
move (Robot dir coords) (instruction : instructions) = case instruction of
  'R' -> (updateRobot $ mkRobot (turnRight dir) coords)
  'L' -> (updateRobot $ mkRobot (turnLeft dir) coords)
  'A' -> (updateRobot $ step $ mkRobot dir coords)
  _   -> mkRobot dir coords
  where updateRobot robot = move robot instructions
