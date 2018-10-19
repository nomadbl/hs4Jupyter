module Main where

import Data.Either
-- start event loop
main :: IO ()
main = loop message

message = "Echo program - enter q to quit"
-- echo back the input string
loop :: String -> IO ()
loop msg= putStrLn msg >> getLine >>= quitOrloop

-- checks wether 'q' was entered and calls loop otherwise
quitOrloop :: String -> IO ()
quitOrloop xs | xs == "q" = putStrLn "Goodbye!"
              | otherwise = loop xs