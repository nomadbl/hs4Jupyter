module Main where

import Data.Either
import Control.Monad

--definition of interact (included in prelude)
--interact g = (liftM g getLine) >>= putStrLn >> f g
when' = flip when
-- event loop
main :: IO ()
-- echo back the input string and nothing if str="q"
main = getLine >>= \s -> (putStrLn (s++"\n") >> main ) `when'` (notquit s)
                 where notquit s = (s /= "q")