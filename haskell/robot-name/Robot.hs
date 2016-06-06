module Robot (mkRobot,
              resetName,
              robotName) where

import Data.IORef (IORef, newIORef, writeIORef, readIORef)
import System.Random (randomRIO)

newtype Robot = Robot {name :: String}

mkRobot :: IO (IORef Robot)
mkRobot = mkRobotName >>= return . Robot >>= newIORef

resetName :: IORef Robot -> IO ()
resetName robotRef = mkRobotName >>= writeIORef robotRef . Robot

robotName :: IORef Robot -> IO String
robotName robotRef = readIORef robotRef >>= return . name

mkRobotName :: IO String
mkRobotName = sequence [chr, chr, num, num, num]
  where 
    chr = randomRIO ('A','Z')
    num = randomRIO ('0','9')
