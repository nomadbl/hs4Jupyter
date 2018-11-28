{-# LANGUAGE OverloadedStrings #-}

-- start up the kernel

module Main where

import Control.Monad
import System.ZMQ4.Monadic

main :: IO ()
main = runZMQ helloZMQ

helloZMQ :: 
liftIO (putStrLn "connecting to hello world server...") >> 
       socket Req >>= \requester -> connect requester "tcp://localhost:5555" >>
       forM_ [1..10] $ \i -> return $
             liftIO . putStrLn $ "Sending Hello " ++ show i ++ "…" >>
             send requester [] "Hello" >> receive requester >>
             liftIO . putStrLn $ "Received World " ++ show i