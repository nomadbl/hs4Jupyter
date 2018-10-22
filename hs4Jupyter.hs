module Main where

import Data.Either
import Control.Monad

--definition of interact (included in prelude)
--interact g = (liftM g getLine) >>= putStrLn >> f g
-- start event loop
main :: IO ()
-- echo back the input string
main = getLine >>= quitOrloop

-- check if 'q' was entered and call main otherwise
quitOrloop :: String -> IO ()
quitOrloop xs | xs == "q" = putStrLn "Goodbye!"
              | otherwise = putStrLn xs >> main