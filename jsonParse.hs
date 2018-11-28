{-# LANGUAGE OverloadedStrings, DeriveGeneric, DeriveAnyClass #-}
module jsonParse where

import GHC.Generics
import Data.ByteString.Lazy.readFile -- readFile :: FilePath -> IO ByteString
import Data.Aeson
import MonadLib
import Data.Maybe
import Data.Text.Lazy.IO 
import Data.Text.Lazy.Encoding

-- automatically define how to read the connection file into a haskell datatype
-- i.e. defines encode and decode functions
-- encode :: ConnectionFile -> ByteString
-- decode :: ByteString -> Maybe ConnectionFile
data ConnectionFile = ConnectionFile {
  control_port :: Int,
  shell_port  :: Int,
  transport :: String,
  signature_scheme :: String,
  stdin_port :: Int,
  hb_port :: Int,
  ip :: String,
  iopub_port :: Int,
  key :: String }
  deriving (Generic, ToJSON, FromJSON)

data JupyterMessageHeader = JupyterMessageHeader {
  msg_id :: Text,
  username :: Text,
  session :: Text,
  date :: Text,
  msg_type :: Text,
  version :: Scientific }
  deriving (Generic, ToJSON, FromJSON)

data JupyterMessage = JupyterMessage {
  header :: JupyterMessageHeader,
  parent_header  :: Object,
  metadata :: Object,
  content :: Object,
  buffers :: Array }
  deriving (Generic, ToJSON, FromJSON)

-------- utility functions
-- get a json bytestring from a file
getJsonText :: IO ByteString -- utf8 encoding result 
getJsonText filepath = Data.ByteString.Lazy.readFile filepath >>=
                       Data.Text.Lazy.Encoding.encodeUtf8

-- get decoded data from specified json file
decodeJsonFile :: FilePath -> IO Value
decodeJsonFile path = let decodes = return . decode :: IO (Maybe Value)
                      in  getJsonText >>= decodes >>= return . fromJust

-------- jupyter messages session monad
-- it carries state about session id, username
-- it generates information about time etc
-- it handles incrementing message uuid's
-- it handles the parent header stuff
-- it wraps the ZMQ monad which does the actual communication
-- it handles communicating with the kernel thread
--> 
data JupyterSession = JupyterSession


-------- pre-defined jupyter massages





